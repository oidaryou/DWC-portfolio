class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  attachment :image

  def favorited_by?(customer)
    favorites.where(customer_id: customer).exists?
  end
end
