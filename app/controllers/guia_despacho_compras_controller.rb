class GuiaDespachoComprasController < ApplicationController
  before_action :set_guia_despacho_compra, only: [:show, :edit, :update, :destroy]

  # GET /guia_despacho_compras
  # GET /guia_despacho_compras.json
  def index
    @guia_despacho_compras = GuiaDespachoCompra.all
  end

  # GET /guia_despacho_compras/1
  # GET /guia_despacho_compras/1.json
  def show
  end

  # GET /guia_despacho_compras/new
  def new
    @guia_despacho_compra = GuiaDespachoCompra.new
  end

  # GET /guia_despacho_compras/1/edit
  def edit
  end

  # POST /guia_despacho_compras
  # POST /guia_despacho_compras.json
  def create
    @guia_despacho_compra = GuiaDespachoCompra.new(guia_despacho_compra_params)

    respond_to do |format|
      if @guia_despacho_compra.save
        format.html { redirect_to @guia_despacho_compra, notice: 'Guia despacho compra was successfully created.' }
        format.json { render :show, status: :created, location: @guia_despacho_compra }
      else
        format.html { render :new }
        format.json { render json: @guia_despacho_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guia_despacho_compras/1
  # PATCH/PUT /guia_despacho_compras/1.json
  def update
    respond_to do |format|
      if @guia_despacho_compra.update(guia_despacho_compra_params)
        format.html { redirect_to @guia_despacho_compra, notice: 'Guia despacho compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @guia_despacho_compra }
      else
        format.html { render :edit }
        format.json { render json: @guia_despacho_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guia_despacho_compras/1
  # DELETE /guia_despacho_compras/1.json
  def destroy
    @guia_despacho_compra.destroy
    respond_to do |format|
      format.html { redirect_to guia_despacho_compras_url, notice: 'Guia despacho compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guia_despacho_compra
      @guia_despacho_compra = GuiaDespachoCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guia_despacho_compra_params
      params.require(:guia_despacho_compra).permit(:doc_com_cod, :dir_cod, :guia_desp_fecha)
    end
end
