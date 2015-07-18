class EstadoArticulosController < ApplicationController
  before_action :set_estado_articulo, only: [:show, :edit, :update, :destroy]

  # GET /estado_articulos
  # GET /estado_articulos.json
  def index
    @estado_articulos = EstadoArticulo.all
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /estado_articulos/1
  # GET /estado_articulos/1.json
  def show
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /estado_articulos/new
  def new
    @estado_articulo = EstadoArticulo.new
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /estado_articulos/1/edit
  def edit
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /estado_articulos
  # POST /estado_articulos.json
  def create
    @estado_articulo = EstadoArticulo.new(estado_articulo_params)

    respond_to do |format|
      if @estado_articulo.save
        format.html { redirect_to @estado_articulo, notice: 'Estado articulo was successfully created.' }
        format.json { render :show, status: :created, location: @estado_articulo }
      else
        format.html { render :new }
        format.json { render json: @estado_articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_articulos/1
  # PATCH/PUT /estado_articulos/1.json
  def update
    respond_to do |format|
      if @estado_articulo.update(estado_articulo_params)
        format.html { redirect_to @estado_articulo, notice: 'Estado articulo was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_articulo }
      else
        format.html { render :edit }
        format.json { render json: @estado_articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_articulos/1
  # DELETE /estado_articulos/1.json
  def destroy
    @estado_articulo.destroy
    respond_to do |format|
      format.html { redirect_to estado_articulos_url, notice: 'Estado articulo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_articulo
      @estado_articulo = EstadoArticulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_articulo_params
      params.require(:estado_articulo).permit(:est_art_nom)
    end
end
