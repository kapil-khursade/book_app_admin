class Book < ApplicationRecord
    validates :name, :author, :publication_year, presence: true
end
