class ProposalsController < ApplicationController

  def new
    if !user_signed_in?
      redirect_to new_user_session_path, notice: 'You need to sign in first'
    else
      @act = Act.find(params[:act_id])
      @proposal = @act.proposals.build
    end
  end

  def create
    @user = current_user
    @act = Act.find(params[:act_id])
    @proposal = @act.proposals.new(params[:proposal])
    @proposal.user = current_user
    if @proposal.save
      UserMailer.act_proposal(@user, @act, @proposal).deliver
      UserMailer.act_book_confirmation(@user, @act).deliver
      redirect_to act_path(@act), notice: 'Thank you for submitting your proposal.'
    else
      render 'new'
    end
  end

end
