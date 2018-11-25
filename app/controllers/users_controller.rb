class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  before_action :set_user, only: [:show, :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def show
    @global_links = GlobalLink.all
    @mylinks = @user.mylinks
    @role_specific_links = RoleSpecificLink.all
    @user = User.find(params[:id])
    @role_specs = RoleSpec.all
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  def new 
    @user = User.new 
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end
  def set_user 
    @user = User.find(params[:id])
  end 
  def secure_params
    params.require(:user).permit(:role)
  end

end
