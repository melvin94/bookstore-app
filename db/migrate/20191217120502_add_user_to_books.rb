class AddUserToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :user
    add_foreign_key :books, :users
  end
end
