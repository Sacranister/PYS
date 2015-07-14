class DetalleDocumentoDeComprasController < ApplicationController
  before_action :set_detalle_documento_de_compra, only: [:show, :edit, :update, :destroy]

  # GET /detalle_documento_de_compras
  # GET /detalle_documento_de_compras.json
  def index
    @detalle_documento_de_compras = DetalleDocumentoDeCompra.all
  end

  # GET /detalle_documento_de_compras/1
  # GET /detalle_documento_de_compras/1.json
  def show
  end

  # GET /detalle_documento_de_compras/new
  def new
    @detalle_documento_de_compra = DetalleDocumentoDeCompra.new
  end

  # GET /detalle_documento_de_compras/1/edit
  def edit
  end

  # POST /detalle_documento_de_compras
  # POST /detalle_documento_de_compras.json
  def create
    @detalle_documento_de_compra = DetalleDocumentoDeCompra.new(detalle_documento_de_compra_params)

    respond_to do |format|
      if @detalle_documento_de_compra.save
        format.html { redirect_to @detalle_documento_de_compra, notice: 'Detalle documento de compra was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_documento_de_compra }
      else
        format.html { render :new }
        format.json { render json: @detalle_documento_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_documento_de_compras/1
  # PATCH/PUT /detalle_documento_de_compras/1.json
  def update
    respond_to do |format|
      if @detalle_documento_de_compra.update(detalle_documento_de_compra_params)
        format.html { redirect_to @detalle_documento_de_compra, notice: 'Detalle documento de compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_documento_de_compra }
      else
        format.html { render :edit }
        format.json { render json: @detalle_documento_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_documento_de_compras/1
  # DELETE /detalle_documento_de_compras/1.json
  def destroy
    @detalle_documento_de_compra.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Linea eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_documento_de_compra
      @detalle_documento_de_compra = DetalleDocumentoDeCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_documento_de_compra_params
      params.require(:detalle_documento_de_compra).permit(:doc_com_cod, :det_doc_com_linea, :ins_cod, :ins_cod_prov, :det_doc_com_cant, :det_doc_com_precio, :det_doc_com_precio_uni)
    end
end
