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
    @user = User.find(params[:id])
    @role_specs = RoleSpec.all
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied you are not an Admin."
      end
    end
  end


  def new 
    @user = User.new 
  end

  def edit  
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
      if @user.update_without_password(secure_params.except(:password, :password_confirmation))
        redirect_to users_path
        flash.now[:notice] = "User updated."
      else
        render :action => 'edit'
      end
    else
      if @user.update_attributes(secure_params)
        redirect_to users_path
        flash[:notice] = "User updated."
      else
        render :action => 'edit'
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def needs_password?(user, params)
    (params[:user].has_key?(:email) && user.email != params[:user][:email]) || !params[:user][:password].blank?
  end
  
  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied you are not an Admin."
    end
  end
  def set_user 
    @user = User.find(params[:id])
  end 
  def secure_params
    params.require(:user).permit(:role, :name, :email, :password, :password_confirmation)
  end

end
