class MediaPostsController < ApplicationController
  before_filter :act_owner

  def index
    @act = Act.find(params[:act_id])
    @media = @act.media_posts.build
  end

  def create
    @act = Act.find(params[:act_id])
    @media = @act.media_posts.new(params[:media_post])
    if @media.save
      redirect_to act_media_posts_path(@act), notice: "Successfully added #{media_type(@media.media_type)}"
    else
      render 'index'
    end
  end

  def destroy_multiple
    @act = Act.find(params[:act_id])
    MediaPost.destroy(params[:media_post_ids])
    redirect_to act_media_posts_path(@act), notice: 'Successfully deleted media'
  end

  private

  def media_type media
    if media == 'youtube'
      'video'
    elsif media == 'soundcloud'
      'audio'
    elsif media == 'image'
      'pictures'
    end
  end

  def act_owner
    unless user_signed_in? && current_user.act == Act.find(params[:act_id])
      redirect_to root_path, notice: 'You can only edit your own act'
    end
  end

end
