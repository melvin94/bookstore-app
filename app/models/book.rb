class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  belongs_to :user

  has_many :reviews

  validates :name, presence: true
  validates :author_id, presence: true
  validates :genre_id, presence: true 
  validates :published_date, presence: true
  validates :description, presence: true

end
