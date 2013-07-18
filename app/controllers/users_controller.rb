class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def new
      @user = User.new
  end

   def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

  def account
    @enrolments = Enrolment.all
    @user = current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
