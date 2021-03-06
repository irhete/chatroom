class UsersController < ApplicationController
  before_filter :signed_in_user, except: [:create, :new]
  before_filter :correct_user,  except: [:create, :new]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created}
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User successfully deleted'  }
      format.json { head :no_content }
    end
  end

  def owned_rooms
    @rooms = @user.owned_rooms
  end


  def member_rooms
    @rooms = @user.rooms
  end


  private

    def signed_in_user
      redirect_to signin_url, :flash => { :error => "Please sign in." } unless signed_in?
    end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to root_path, :flash => { :error => "You don't have permissions to this page." } unless current_user?(@user)
    end
end
