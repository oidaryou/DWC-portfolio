class LikesController < ApplicationController
  def create

    @like = current_customer.likes.new(review_id: params[:review_id])
    @review = @like.review
    if @like.save
      flash[:success] = 'いいね登録しました'
    end
  end

  def destroy
    @like = Like.find_by(customer_id: current_customer.id, review_id: params[:review_id])
    @review = @like.review
    if @like.destroy
      flash[:success] = 'いいね解除しました'
    end
  end

  private

  def like_params
    params.require(:like).permit(:review_id, :customer_id)
  end
end
