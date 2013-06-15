class PostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user_for_create ,  only: [:create]
  before_filter :correct_user_for_delete ,  only: [:delete]

  def create
    @room = Room.find(params[:room_id])
    param_hash = params[:post]
    param_hash[:username] = current_user.name
    @post = @room.posts.create(param_hash)
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:id])
    @post.destroy
    redirect_to room_path(@room)
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  
 def correct_user_for_create
      @room = Room.find(params[:room_id])
      redirect_to(root_path) unless @room.members.include?(current_user)
    end

  def correct_user_for_delete
      @room = Room.find(params[:room_id])
      @post = @room.posts.find(params[:id])
      redirect_to(root_path) unless @post.username == current_user.name || @room.owner == current_user
    end
end
