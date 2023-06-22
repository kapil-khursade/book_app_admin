class Book < ApplicationRecord
    belongs_to :shelf
    validates :name, :author, :publication_year, presence: true

    def section
    end

end
