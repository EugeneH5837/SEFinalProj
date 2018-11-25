class Users::MylinksController < ApplicationController
  before_action :set_mylink, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]

  # GET /mylinks
  # GET /mylinks.json
  def index
    @mylinks = Mylink.all
  end

  # GET /mylinks/1
  # GET /mylinks/1.json
  def show
  end

  # GET /mylinks/new
  def new
    @mylink = Mylink.new
  end

  # GET /mylinks/1/edit
  def edit
  end

  # POST /mylinks
  # POST /mylinks.json
  def create
    @mylink = Mylink.new(mylink_params)
    @mylink.user_id = @user.id
    respond_to do |format|
      if @mylink.save
        format.html { redirect_to user_url(@mylink.user_id), notice: 'Mylink was successfully created.' }
        format.json { render :show, status: :created, location: @mylink }
      else
        format.html { render :new }
        format.json { render json: @mylink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mylinks/1
  # PATCH/PUT /mylinks/1.json
  def update
    respond_to do |format|
      if @mylink.update(mylink_params)
        format.html { redirect_to user_url(@mylink.user_id), notice: 'Mylink was successfully updated.' }
        format.json { render :show, status: :ok, location: @mylink }
      else
        format.html { render :edit }
        format.json { render json: @mylink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mylinks/1
  # DELETE /mylinks/1.json
  def destroy
    @mylink.destroy
    respond_to do |format|
      format.html { redirect_to user_url(@mylink.user_id), notice: 'Mylink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user 
      @user = User.find(params[:user_id])
    end 
    
    def set_mylink
      @mylink = Mylink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mylink_params
      params.require(:mylink).permit(:link)
    end
end
