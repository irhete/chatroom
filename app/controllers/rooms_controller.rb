class RoomsController < ApplicationController
  def index
    @rooms = Room.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @room = @user.owned_rooms.create(params[:room])
    redirect_to user_path(@user)
  end
  
  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end
end
