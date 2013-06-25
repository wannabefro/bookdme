class ReviewsController < ApplicationController
  before_filter :act_owner

  def index
  end

  private

  def act_owner
    unless user_signed_in? && current_user.act == Act.find(params[:act_id])
      redirect_to root_path, notice: 'You can only edit your own act'
    end
  end

end
