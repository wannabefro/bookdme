class VenuesController < ApplicationController
  def new
    if !user_signed_in?
      redirect_to new_user_session_path, notice: 'You need to sign in first'
    else
      @user = current_user
      @venue = @user.venues.build
    end
  end

  def create
    @user = current_user
    @venue = @user.venues.new(params[:venue])
    if @venue.save
      redirect_to root_path, notice: 'Successfully added a venue'
    else
      render 'new'
    end
  end
end
