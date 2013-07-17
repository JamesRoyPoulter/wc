class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def new
      @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
  @user = User.find(params[:id])
  @user.destroy

  respond_to do |format|
    format.html { redirect_to users_path }
    format.json { head :no_content }
  end
  end
end
