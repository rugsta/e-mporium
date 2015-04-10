class OrdersController < ApplicationController

  skip_before_action :authorize

  #SetExpressCheckout---------------------------------------
  def setup_checkout
    response = EXPRESS_GATEWAY.setup_purchase(@my_cart.price_in_cents,
       return_url: new_order_url,
       cancel_return_url: store_url,
       currency: "AUD",
       allow_guest_checkout: true,
       items: [{description: "e-mporium cart order", amount: @my_cart.price_in_cents}]
    )
      redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
      puts "COMPLETED SetExpressCheckout"
  end


  #==========================================================
  def new
    update_cart
    express_token(params[:token])

    @order = Order.new()
    @order.update_attributes(
        :cart_id          => @my_cart.id,
        :correlationID    => @details.params["correlation_id"],
        :ip_address       => request.remote_ip,
        :version          => @details.params["version"],
        :build            => @details.params["build"],
        :checkout_status  => @details.params["checkout_status"]
     )

    do_purchase
    update_order
    express_token(params[:token])
    update_order
    customer_redirect
    do_validity_checks_and_finalise
    #binding.pry

  end
  #==========================================================


  def update_cart
    @my_cart.update_attributes(
        :ip_address      => request.remote_ip,
        :express_tokenID => params[:token],
        :express_payerID => params[:PayerID])
    puts "RESPONSE token + PayerID"
  end

  #GetExpressCheckoutDetails---------------------------------
  def express_token(token)
    if !token.blank?
      puts "CALL GetExpressCheckoutDetails"
      @details = EXPRESS_GATEWAY.details_for(token)
    end
  end

  #DoExpressCheckoutPayment ---------------------------------
  def do_purchase
    do_purchase_credentials={
        :ip       => request.remote_ip,
        :token    => @my_cart.express_tokenID,
        :payer_id => @my_cart.express_payerID,
        :currency => "AUD"
    }
      @response = EXPRESS_GATEWAY.purchase(@my_cart.price_in_cents, do_purchase_credentials)
  end


  def update_order
    @order.update_attributes(
        :transactionID              => @response.params["PaymentInfo"]["TransactionID"],
        :checkout_status            => @details.params["checkout_status"],
        :transaction_type           => @response.params["PaymentInfo"]["TransactionType"],
        :payment_type               => @response.params["PaymentInfo"]["PaymentType"],
        :payment_date               => @response.params["PaymentInfo"]["PaymentDate"],
        :payment_status             => @response.params["PaymentInfo"]["PaymentStatus"],
        :pending_reason             => @response.params["PaymentInfo"]["PendingReason"],
        :gross_amount_currency_id   => @response.params["gross_amount_currency_id"],
        :gross_amount               => @response.params["PaymentInfo"]["GrossAmount"],
        :fee_amount                 => @response.params["PaymentInfo"]["FeeAmount"],
        :net_amount                 => ((@response.params["PaymentInfo"]["GrossAmount"].to_f - @response.params["PaymentInfo"]["FeeAmount"].to_f)).round(2),
        :express_tokenID            => @response.params["Token"],
        :secure_merchant_account_id => @response.params["PaymentInfo"]["SellerDetails"]["SecureMerchantAccountID"]
    )
  end

  def customer_redirect
    if @order.save
        redirect_to "http://consequentialexperimentation.com/blog"
    else
        redirect_to "http://consequentialexperimentation.com/poundswick"
    end
  end

  def do_validity_checks_and_finalise

    if (
          @my_cart.ip_address      == @order.ip_address &&
          @my_cart.express_tokenID == @order.express_tokenID &&
          @my_cart.price_in_cents  == ((@order.gross_amount.to_f * 100).to_i) &&
          @order.checkout_status   == "PaymentActionCompleted" &&
          @order.payment_status    == "Completed"
        )
       @my_cart.update_attributes(:checked_out => true)
    else
        #some kind of error needs to go someplace
    end
  end

end