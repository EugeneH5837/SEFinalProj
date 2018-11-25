class Users::RoleSpecificLinksController < ApplicationController
  before_action :set_role_specific_link, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]
  # GET /role_specific_links
  # GET /role_specific_links.json
  def index
    @role_specific_links = RoleSpecificLink.all
  end

  # GET /role_specific_links/1
  # GET /role_specific_links/1.json
  def show
  end

  # GET /role_specific_links/new
  def new
    @role_specific_link = RoleSpecificLink.new
  end

  # GET /role_specific_links/1/edit
  def edit
  end

  # POST /role_specific_links
  # POST /role_specific_links.json
  def create
    @role_specific_link = RoleSpecificLink.new(role_specific_link_params)
    @role_specific_link.role_id = @user.role
    #@role_specific_link = @user.role_specific_links.build(role_specific_link_params)
    respond_to do |format|
      if @role_specific_link.save
        format.html { redirect_to @role_specific_link, notice: 'Role specific link was successfully created.' }
        format.json { render :show, status: :created, location: @role_specific_link }
      else
        format.html { render :new }
        format.json { render json: @role_specific_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_specific_links/1
  # PATCH/PUT /role_specific_links/1.json
  def update
    respond_to do |format|
      if @role_specific_link.update(role_specific_link_params)
        format.html { redirect_to @role_specific_link, notice: 'Role specific link was successfully updated.' }
        format.json { render :show, status: :ok, location: @role_specific_link }
      else
        format.html { render :edit }
        format.json { render json: @role_specific_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_specific_links/1
  # DELETE /role_specific_links/1.json
  def destroy
    @role_specific_link.destroy
    respond_to do |format|
      format.html { redirect_to role_specific_links_url, notice: 'Role specific link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user 
      @user = User.find(params[:user_id])
    end 
    # Use callbacks to share common setup or constraints between actions.
    def set_role_specific_link
      @role_specific_link = RoleSpecificLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_specific_link_params
      params.require(:role_specific_link).permit(:link, :correspondingRole)
    end
end
