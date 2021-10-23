class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book
  has_many :likes, dependent: :destroy
  #validates :review, {presence: true, lengh: {maximum: 140}}
end
