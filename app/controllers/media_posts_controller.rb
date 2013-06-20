class MediaPostsController < ApplicationController
  before_filter :act_owner

  def new
    @act = Act.find(params[:act_id])
    @media = @act.media_posts.build
  end

  def create
    @act = Act.find(params[:act_id])
    @media = @act.media_posts.new(params[:media_post])

    if @media.save
      redirect_to :back, notice: "Successfully added #{media_type(@media.media_type)}"
    else
      render 'new'
    end
  end


  private

  def media_type media
    if media == 'youtube'
      'video'
    else
      'audio'
    end
  end

  def act_owner
    unless user_signed_in? && current_user.act == Act.find(params[:act_id])
      redirect_to root_path, notice: 'You can only edit your own act'
    end
  end

end
