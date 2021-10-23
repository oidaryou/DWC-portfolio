class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  attachment :image
  

  def self.books_search(keyword, genre_id = nil)
    if genre_id.present?
      where('title like ?', "%#{keyword}%")
      .where(genre_id: genre_id)
    else
      where('title like ?', "%#{keyword}%")
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer).exists?
  end
end
