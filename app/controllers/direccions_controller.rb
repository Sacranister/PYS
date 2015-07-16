class DireccionsController < ApplicationController
  before_action :set_direccion, only: [:show, :edit, :update, :destroy]

  # GET /direccions
  # GET /direccions.json
  def index  
           if current_user
      if current_user.role=='cliente'
        @direccions = Direccion.all
      else
          respond_to do |format|
            format.html { redirect_to :root}
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root }
      end
    end
  end

  # GET /direccions/1
  # GET /direccions/1.json
  def show
    respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /direccions/new
  def new
    
               if current_user
      if current_user.role=='cliente'
        @direccion = Direccion.new
      else
          respond_to do |format|
            format.html { redirect_to :root}
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root }
      end
    end
  end

  # GET /direccions/1/edit
  def edit
               if current_user
      if current_user.role=='cliente'
      else
          respond_to do |format|
            format.html { redirect_to :root}
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root }
      end
    end
  end

  # POST /direccions
  # POST /direccions.json
  def create
    @direccion = Direccion.new(direccion_params)
    @client=Cliente.where(cli_mail: current_user.email).take
    @direccion.cli_cod=@client.cli_cod 
    respond_to do |format|
      if @direccion.save
        format.html { redirect_to @direccion, notice: 'Direccion was successfully created.' }
        format.json { render :show, status: :created, location: @direccion }
      else
        format.html { render :new }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direccions/1
  # PATCH/PUT /direccions/1.json
  def update
    respond_to do |format|
      if @direccion.update(direccion_params)
        format.html { redirect_to @direccion, notice: 'Direccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @direccion }
      else
        format.html { render :edit }
        format.json { render json: @direccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direccions/1
  # DELETE /direccions/1.json
  def destroy
    @direccion.destroy
    respond_to do |format|
      format.html { redirect_to direccions_url, notice: 'Direccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direccion
      @direccion = Direccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direccion_params
      params.require(:direccion).permit(:cli_cod, :guia_desp_cod, :dir_calle, :dir_numero, :dir_comuna, :dir_ciudad, :dir_tipo)
    end
end
