class BiographiesController < ApplicationController
  before_filter :act_owner

  def index
    @act = Act.find(params[:act_id])
    if @act.biographies.any?
      @bio = @act.biographies.first
    else
      @bio = @act.biographies.build
    end
  end

  def create
    @act = Act.find(params[:act_id])
    @bio = @act.biographies.new(params[:biography])
    if @bio.save
      redirect_to act_biographies_path(@act), notice: 'Successfully updated biography'
    else
      render 'index'
    end
  end

  def update
    @act = Act.find(params[:act_id])
    @bio = @act.biographies.find(params[:id])
    if @bio.update_attributes(params[:biography])
      redirect_to act_biographies_path(@act), notice: 'Successfully updated biography'
    else
      redirect_to act_biographies_path(@act), notice: "Couldn't update the biography"
    end
  end

  private

  def act_owner
    unless user_signed_in? && current_user.act == Act.find(params[:act_id])
      redirect_to root_path, notice: 'You can only edit your own act'
    end
  end

end
