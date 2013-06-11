class PostsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    param_hash = params[:post]
    param_hash[:user] = @room.owner
    @post = @room.posts.create(param_hash)
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:id])
    @post.destroy
    redirect_to room_path(@room)
  end
end
