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
        if params[:id]
          @message = "No se puede crear usuario con id"
          format.html { render :new }
          format.json { render "error", status: :bad_request }
        else
          if params[:usuario] && params[:nombre]
            @user = User.new(usuario:params[:usuario], nombre:params[:nombre], apellido:params[:apellido], twitter:params[:twitter])
            @user.save
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render :show, status: :created }
          else
            @message = "La creación ha fallado"
            format.html { render :new }
            format.json { render "error", status: :internal_server_error }
          end
        end
      rescue
        @message = "La creación ha fallado"
        format.html { render :new }
        format.json { render json: "error", status: :internal_server_error }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      begin
        if request.raw_post.include? "id"
          @message = "id no es modificable"
          format.html { render :new }
          format.json { render "error", status: :bad_request }
        else
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
          format.json { render :show, status: :ok }
        end
      rescue
        @message = "La modificación ha fallado"
        format.html { render :new }
        format.json { render json: "error", status: :internal_server_error }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      begin
        @user = User.find(params[:id])
      rescue
        @message = "Usuario no encontrado"
        respond_to do |format|
          format.json { render "error", status: :not_found }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:id, :format, :usuario, :nombre, :apellido, :twitter)
    end
end
