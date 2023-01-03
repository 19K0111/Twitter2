class FollowsController < ApplicationController
  # before_action :set_follow, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # def list
  #   @users = User.all
  #   @users -= [current_user]
  # end


  # put /follows/follow
  # put /follows/follow.json
  def follow
    follow_params = {
      :follow_user_id => params[:id],
      :user_id => current_user.id
    }
    @follow = Follow.new( follow_params )

    respond_to do |format|
      if @follow.save
        format.html { redirect_to user_path(params["id"]) }
        format.json { render :json => @follow  }
      else
        format.html { render action: "list", :alert => 'Failed to follow.' }
        format.json { render json: @follow.errors }
      end
    end
  end

  # put /follows/cancel
  # put /follows/cancel.json
  def cancel
    @follow = Follow.find_by_id( params[:id] )
    @follow.destroy
    redirect_to user_path(params["id"])
  end

  # GET /follows or /follows.json
  def index
    @follows = Follow.all
    @users = User.all
    @users -= [current_user]
    @follows = Follow.where(user_id: current_user.id)
  end

  # GET /follows/1 or /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows or /follows.json
  def create
    @follow = Follow.new(follow_params)

    respond_to do |format|
      if @follow.save
        format.html { redirect_to follow_url(@follow), notice: "Follow was successfully created." }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follows/1 or /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to follow_url(@follow), notice: "Follow was successfully updated." }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1 or /follows/1.json
  def destroy
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to follows_url, notice: "Follow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.require(:follow).permit(:user_id, :follow_user_id)
    end
end
