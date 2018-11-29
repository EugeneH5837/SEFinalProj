class GlobalLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => :show
  before_action :set_global_link, only: [:show, :edit, :update, :destroy]
  
  # GET /global_links
  # GET /global_links.json
  def index
    @global_links = GlobalLink.all
  end

  # GET /global_links/1
  # GET /global_links/1.json
  def show
  end

  # GET /global_links/new
  def new
    @global_link = GlobalLink.new
  end

  # GET /global_links/1/edit
  def edit
  end

  # POST /global_links
  # POST /global_links.json
  def create
    @global_link = GlobalLink.new(global_link_params)


      if @global_link.save
        redirect_to global_links_path 
        #flash[:notice] = 'Global Links Sucessfully Created.'
        
      else
        format.html { render :new }
        format.json { render json: @global_link.errors, status: :unprocessable_entity }
      end
    
  end

  # PATCH/PUT /global_links/1
  # PATCH/PUT /global_links/1.json
  def update
    respond_to do |format|
      if @global_link.update(global_link_params)
        redirect_to global_links_path
        #flash[:notice] = 'Global Links Sucessfully Edited.'
        #format.json { render :show, status: :ok, location: @global_link }
      else
        format.html { render :edit }
        format.json { render json: @global_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /global_links/1
  # DELETE /global_links/1.json
  def destroy
    @global_link.destroy
    respond_to do |format|
      format.html { redirect_to global_links_url}
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
    def set_global_link
      @global_link = GlobalLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def global_link_params
      params.require(:global_link).permit(:link)
    end
end
