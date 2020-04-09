class UsersController < ApplicationController
  before_action :authorize, only: [:change_password, :edit, :edit_info, :update_info]
  before_action :logged_in, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Registered successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def change_password
    user = User.find_by(id: current_user)
    if user && user.authenticate(params[:user][:old_password])
      if user.update_attributes(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
        flash[:notice] = "Password changed successfully"
        redirect_to root_path
      else
        flash[:notice] = "Two password entries are inconsistent!"
        redirect_to change_password_path
      end
    else
      flash[:notice] = "Original password input error! "
      redirect_to change_password_path
    end
  end

  def edit_info
  end

  def update_info
    user = User.find_by(id: current_user)
    if user.update(user_params)
      flash[:notice] = "Personal Info changed successfully"
      redirect_to root_path
    else
      flash[:notice] = "Personal Info changed failed!"
      redirect_to change_password_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end

    def logged_in
      redirect_to root_url if logged_in?
    end

end
