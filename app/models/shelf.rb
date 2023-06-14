class Shelf < ApplicationRecord
    belongs_to :section
    has_many :books
    validates :name, presence: true
end
