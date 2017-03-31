class UsersController < ApplicationController
  protect_from_forgery :except => [:update, :destroy, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      begin
        @user = User.new(usuario:params[:usuario], nombre:params[:nombre])
        begin
          @user.apellido = params[:apellido]
        rescue
        end
        begin
          @user.twitter = params[:twitter]
        rescue
        end
        @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      rescue
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      begin
        if params[:usuario]
          @user.usuario = params[:usuario]
        end
        if params[:nombre]
          @user.nombre = params[:nombre]
        end
        if params[:apellido]
          @user.apellido = params[:apellido]
        end
        if params[:twitter]
          @user.twitter = params[:twitter]
        end
        @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      rescue
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    puts params
    puts "Aqui paso yo"
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:usuario, :nombre, :apellido, :twitter)
    end
end
