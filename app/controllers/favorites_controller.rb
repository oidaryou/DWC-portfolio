class FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(customer_id: current_customer.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(customer_id: current_customer.id)
    if favorite.present?
        favorite.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
