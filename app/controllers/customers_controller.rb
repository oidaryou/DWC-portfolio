class CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(6)
  end

  def show
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:book_id)
    @favorite_list = Book.find(favorites)

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def mypage
    @customer = Customer.find(params[:id])
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def like
    @customer = Customer.find(params[:id])
    @likes = Like.where(customer_id: current_customer.id)
  end

  def search
    @customers = Customer.customers_search(params[:keyword]).page(params[:page]).per(8)
    @keyword = params[:keyword]
    render 'index'
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end
