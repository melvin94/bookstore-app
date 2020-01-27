class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :review, presence: true

end
