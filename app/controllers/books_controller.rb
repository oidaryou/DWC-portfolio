class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
  end

  def create
  end

  def edit
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end

  def update
  end

  def destory
  end

  private
  def book_params
    params.require(:book).permit(:content)
  end
end
