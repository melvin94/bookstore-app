class Author < ApplicationRecord
    has_many :books
    validates :author, presence: true

    ## To delete duplicate records
    # Author.where.not(id: Author.group(:author).select("min(id)")).destroy_all

    def self.already_has_author(author_param)
        Author.pluck(:author).include?(author_param)
    end

end
