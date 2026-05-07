class Book < ApplicationRecord
    has_many :reviews, dependent: :destroy
    validates :title, :author, :genre, :description, presence: true
end
