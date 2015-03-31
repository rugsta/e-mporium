class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string  :user_id
      t.string  :ip_address
      t.string  :express_tokenID
      t.string  :express_payerID

      t.boolean :checked_out, default: false
      t.string  :invoiceNo
      t.timestamps
    end
  end
end
