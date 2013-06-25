class ReviewsController < ApplicationController
  before_filter :act_owner

  def index
    @act = Act.find(params[:act_id])
    @review = Review.new
  end

  def create
    @act = Act.find(params[:act_id])
    @review = @act.reviews.new(params[:review])
    if @review.save
      redirect_to act_reviews_path(@act), notice: 'Successfully added review'
    else
      render 'index'
    end
  end

  def destroy
    @act = Act.find(params[:act_id])
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to act_reviews_path(@act), notice: 'Successfully deleted review'
    else
      render 'index'
    end
  end

  private

  def act_owner
    unless user_signed_in? && current_user.act == Act.find(params[:act_id])
      redirect_to root_path, notice: 'You can only edit your own act'
    end
  end

end
