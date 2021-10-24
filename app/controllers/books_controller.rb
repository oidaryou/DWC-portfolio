class BooksController < ApplicationController
  def new; end

  def index
    @books = Book.page(params[:page]).per(8)
    @favorites_count = Favorite.where(book_id: @book).count
  end

  def create; end

  def edit; end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end

  def update; end

  def destory; end

  def search
    @genre_id = params[:genre_id]
    @books = Book.books_search(params[:keyword], @genre_id).page(params[:page]).per(8)
    @keyword = params[:keyword]
    render 'index'
  end

  def genre_s
    @books = Book.where( genre_id: "1").page(params[:page]).per(8)
  end

  def genre_m
    @books = Book.where( genre_id: "2").page(params[:page]).per(8)
  end

  def genre_z
    @books = Book.where( genre_id: "3").page(params[:page]).per(8)
  end

  def rank
    @all_ranks = Book.find(Favorite.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
    @novel_ranks = Book.find(Favorite.group(:book_id).order('count(book_id) desc').pluck(:book_id)).select{ |book| book.genre.id == 1}
    @comic_ranks = Book.find(Favorite.group(:book_id).order('count(book_id) desc').pluck(:book_id)).select{ |book| book.genre.id == 2}
    @magazine_ranks = Book.find(Favorite.group(:book_id).order('count(book_id) desc').pluck(:book_id)).select{ |book| book.genre.id == 3}
  end

  private

  def book_params
    params.require(:book).permit(:content)
  end
end
