class ActsController < ApplicationController

  def index
    @acts = Act.text_search(params[:query])
  end

  def new
    @act = Act.new
    if !user_signed_in?
      redirect_to new_user_registration_path, :alert => 'You need to sign up for an account first'
    elsif user_signed_in?
      @user = current_user
      if @user.act
        redirect_to act_path(@user.act.id), :alert => 'You can only have one act.'
      end
    end
  end

  def create
    @act = Act.new(params[:act])
    @act.user_id = current_user.id
    @user = current_user
    if @act.save
      UserMailer.act_signup_confirmation(@user, @act).deliver
      redirect_to @act, :notice => "Welcome #{@act.name} to Bookd.me"
    else
      render action: "new"
    end
  end

  def show
    @act = Act.find(params[:id])
    @proposal = @act.proposals.build
  end

  def edit
    if user_signed_in?
      @user = current_user
      if @user.act
        @act = Act.find_by_id(@user.act)
      else
        redirect_to acts_path, alert: 'You must have an act to edit it - idiot'
      end
    else
      redirect_to acts_path, alert: 'You must log in to edit your act'
    end
  end






end
