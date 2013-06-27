class ProposalsController < ApplicationController

  def new
    if !user_signed_in?
      redirect_to new_user_session_path, notice: 'You need to sign in first'
    else
      @act = Act.find(params[:act_id])
      @proposal = @act.proposals.build
    end
  end

  def index
    act_owner
    @act = Act.find(params[:act_id])
    @proposals = @act.proposals
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

  def destroy
    act_owner
    @act = Act.find(params[:act_id])
    @proposal = Proposal.find(params[:id])
    if @proposal.destroy
      redirect_to act_proposals_path(@act), notice: 'Successfully deleted proposal'
    else
      render 'index'
    end
  end

  def act_owner
    unless user_signed_in? && current_user.act == Act.find(params[:act_id])
      redirect_to root_path, notice: 'You can only edit your own act'
    end
  end

end
