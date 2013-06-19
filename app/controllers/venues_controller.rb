class VenuesController < ApplicationController
  def new
    if !user_signed_in?
      redirect_to new_user_session_path, notice: 'You need to sign in first'
    else
      @user = User.find(params[:user_id])
      @venue = @user.venues.build
    end
  end
end
