class AddReviewsToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :review
    add_foreign_key :users, :reviews

    add_reference :books, :review
    add_foreign_key :books, :reviews

  end
end
