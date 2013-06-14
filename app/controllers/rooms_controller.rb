class RoomsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,  only: [:edit, :update, :show]

  def index
    @rooms = Room.all
    @user = current_user
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @room = @user.owned_rooms.create(params[:room])
    @room.members << @user
    redirect_to user_path(@user)
  end
  
  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @user = current_user
    @room = Room.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  def kick
    @room = Room.find(params[:id])
    @user = User.find(params[:user_id])
    @room.members.delete(@user)
    if @room.owner == current_user 
      redirect_to room_path(@room)
    else
      redirect_to user_path(@user)
    end
  end

   def join_room
    @room = Room.find(params[:id])
    @room.members << current_user
    redirect_to room_path(@room)
  end


  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  
  def correct_user
      @room = Room.find(params[:id])
      redirect_to(root_path) unless @room.members.include?(current_user)
    end

end
