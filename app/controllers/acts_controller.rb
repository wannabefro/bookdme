class ActsController < ApplicationController

  def index
    @acts = Act.all
  end

  def new
    @act = Act.new
    if !user_signed_in?
      redirect_to new_user_registration_path, :alert => 'You need to sign up for an account first'
    end
  end

  def create
    @act = Act.new(params[:act])
    @act.user_id = current_user.id
    if @act.save
      redirect_to @act, :notice => "Welcome #{@act.name} to Bookd.me"
    end
  end

  def show
    @act = Act.find(params[:id])
  end
end
