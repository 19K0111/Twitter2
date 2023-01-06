class LikesController < ApplicationController
  before_action :authenticate_user!
  def list
    # @tweets = Tweet.all
    # @likes = Like.where(user_id: current_user.id)
    redirect_to root_path
  end

  # put /likes/add
  # put /likes/add.json
  def add
    like_params = {
      :user_id => current_user.id,
      :tweet_id => params[:id]
    }
    @like = Like.new( like_params )

    respond_to do |format|
      if @like.save
        format.html { redirect_to root_path(params[:id]) }
        format.json { render :json => @like  }
      else
        format.html { render action: "list", :alert => 'Failed to like.' }
        format.json { render json: @like.errors }
      end
    end
  end

  # put /likes/cancel
  # put /likes/cancel.json
  def cancel
    @like = Like.find_by_id( params[:id] )
    @like.destroy
    redirect_to root_path(params[:id])
  end

  def index
    @likes = Like.where(user_id: params[:user_id].to_i)
  end
end
