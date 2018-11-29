class RoleSpecsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  before_action :set_role_spec, only: [:show, :edit, :update, :destroy]

  # GET /role_specs
  # GET /role_specs.json
  def index
    @role_specs = RoleSpec.all
  end

  # GET /role_specs/1
  # GET /role_specs/1.json
  def show
  end

  # GET /role_specs/new
  def new
    @role_spec = RoleSpec.new
  end

  # GET /role_specs/1/edit
  def edit
  end

  # POST /role_specs
  # POST /role_specs.json
  def create
    @role_spec = RoleSpec.new(role_spec_params)
    
    respond_to do |format|
      if @role_spec.save
        format.html { redirect_to role_specs_url, notice: 'Role Specific Link was successfully created.' }
        format.json { render :show, status: :created, location: @role_spec }
      else
        format.html { render :new }
        format.json { render json: @role_spec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_specs/1
  # PATCH/PUT /role_specs/1.json
  def update
    @role_spec = RoleSpec.find(params[:id])
    respond_to do |format|
      if @role_spec.update_attributes(role_spec_params)
        format.html { redirect_to role_specs_url, notice: 'Role Speciic Link was successfully edited.' }
        format.json { render :show, status: :ok, location: @role_spec }
      else
        format.html { render :edit }
        format.json { render json: @role_spec.errors, status: :unprocessable_entity }
      end
    end 
=begin
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
=end
  end

  # DELETE /role_specs/1
  # DELETE /role_specs/1.json
  def destroy
    @role_spec.destroy
    respond_to do |format|
      format.html { redirect_to role_specs_url, notice: 'Role spec was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def admin_only
      unless current_user.admin?
        redirect_to root_path, :alert => "Access denied you are not an Admin."
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_role_spec
      @role_spec = RoleSpec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_spec_params
      params.require(:role_spec).permit(:link, :role_id)
    end
end
