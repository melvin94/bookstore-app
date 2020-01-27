class AddBookToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :book
    add_foreign_key :users, :books
  end
end
