class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id

      t.string  :ip_address
      t.string  :transactionID
      t.string  :checkout_status
      t.string  :correlationID
      t.string  :version
      t.string  :build

      t.string  :transaction_type
      t.string  :payment_type
      t.string  :payment_date
      t.string  :payment_status
      t.string  :pending_reason

      t.string  :gross_amount_currency_id
      t.string  :gross_amount
      t.string  :fee_amount
      t.string  :net_amount

      t.string  :express_tokenID
      t.string  :secure_merchant_account_id



      t.timestamps
    end
  end
end

