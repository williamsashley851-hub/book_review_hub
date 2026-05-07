class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  
  validates :content, :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 
}
end
