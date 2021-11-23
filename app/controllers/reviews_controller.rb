class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = current_customer.reviews.new(review_params)
    @review.book_id = @book.id
    @review.score = Language.get_data(review_params[:review])  #この行を追加+

    if @review.save
    redirect_to book_path(params[:book_id])
    else
      @reviews = Review.all
      render 'books/show'
    end
  end

  def index; end

  def edit; end

  def destroy
    Review.find_by(id: params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def review_params
    params.require(:review).permit(:review)
  end
end
