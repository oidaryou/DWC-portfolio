class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :book
  has_many :likes, dependent: :destroy
end
