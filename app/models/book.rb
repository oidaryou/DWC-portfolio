class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :customer
end
