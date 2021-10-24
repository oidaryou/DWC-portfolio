class HomesController < ApplicationController
  def top
    favorite_ranking_data = Favorite.where(created_at: [1.weeks.ago..Time.now]).group(:book_id).count
    favorite_ranking_data = favorite_ranking_data.sort_by { |key, value| value }.reverse

    @favorite_ranking_top_5 = []
    favorite_ranking_data.take(5).each do |key, value|
      @favorite_ranking_top_5 += [ book: Book.find(key), favorite: value ]
    end
  end

  def about; end
end
