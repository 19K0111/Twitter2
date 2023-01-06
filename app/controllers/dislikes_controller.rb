class DislikesController < ApplicationController
  before_action :authenticate_user!
  def list
    # @tweets = Tweet.all
    # @disdislikes = Disdislike.where(user_id: current_user.id)
    redirect_to root_path
  end

  # put /dislikes/add
  # put /dislikes/add.json
  def add
    dislike_params = {
      :user_id => current_user.id,
      :tweet_id => params[:id]
    }
    @dislike = Dislike.new( dislike_params )

    respond_to do |format|
      if @dislike.save
        format.html { redirect_to root_path(params[:id]) }
        format.json { render :json => @dislike  }
      else
        format.html { render action: "list", :alert => 'Failed to dislike.' }
        format.json { render json: @dislike.errors }
      end
    end
  end

  # put /dislikes/cancel
  # put /dislikes/cancel.json
  def cancel
    @dislike = Dislike.find_by_id( params[:id] )
    @dislike.destroy
    redirect_to root_path(params[:id])
  end

  def index
    if params[:user_id].to_i == current_user.id
      @dislikes = Dislike.where(user_id: params[:user_id].to_i)
    else
      @dislikes = []
    end
  end
end
