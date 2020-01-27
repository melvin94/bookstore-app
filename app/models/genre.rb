class Genre < ApplicationRecord
    has_many :books

    validates :name, presence: true

    ## To delete duplicate records
    # Genre.where.not(id: Genre.group(:name).select("min(id)")).destroy_all

    def self.already_has_genre(genre_param)
        Genre.pluck(:name).include?(genre_param)
    end

end
