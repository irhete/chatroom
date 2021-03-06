class PostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user_for_create ,  only: [:create]
  before_filter :correct_user_for_delete ,  only: [:delete]

respond_to :html, :js

  def index
    @room = Room.find(params[:room_id])
    @posts = @room.posts
    @user = current_user
  end

  def create
    @room = Room.find(params[:room_id])
    param_hash = params[:post]
    param_hash[:username] = current_user.name
    @post = @room.posts.create!(param_hash)
    @user = current_user
    #redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:id])
    @post.destroy
    redirect_to room_path(@room)
  end

  private

    def signed_in_user
      redirect_to signin_url, :flash => { :error => "Please sign in." } unless signed_in?
    end
  
 def correct_user_for_create
      @room = Room.find(params[:room_id])
      redirect_to root_path, :flash => { :error => "You don't have permissions to this page." } unless @room.members.include?(current_user)
    end

  def correct_user_for_delete
      @room = Room.find(params[:room_id])
      @post = @room.posts.find(params[:id])
      redirect_to root_path, :flash => { :error => "You don't have permissions to this page." } unless @post.username == current_user.name || @room.owner == current_user
    end
end
