class AddPurchasesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :purchase
    add_foreign_key :users, :purchases
  end
end
