class Section < ApplicationRecord
    has_many :shelves
    validates :name, presence: true
end
