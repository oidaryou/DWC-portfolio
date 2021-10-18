class LikesController < ApplicationController
  def create
    @like = current_customer.likes.new(review_id: params[:review_id])
    if @like.save
      flash[:success] = 'いいね登録しました'
      redirect_to request.referer
    end
  end

  def destroy
    @like = Like.find_by(customer_id: current_customer.id, review_id: params[:review_id])
    if @like.destroy
      flash[:success] = 'いいね解除しました'
      redirect_to request.referer
    end
  end

  private

  def like_params
    params.require(:like).permit(:review_id, :customer_id)
  end
end
