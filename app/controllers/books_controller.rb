class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.page(params[:page]).per(4)
    @favorites_count = Favorite.where(book_id: @book).count
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

  def search
  @books = Book.books_search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
  end

  private
  def book_params
    params.require(:book).permit(:content)
  end
end
