class DocumentoDeComprasController < ApplicationController
  before_action :set_documento_de_compra, only: [:show, :edit, :update, :destroy]

  # GET /documento_de_compras
  # GET /documento_de_compras.json
  def index
    @documento_de_compras = DocumentoDeCompra.all
  end

  # GET /documento_de_compras/1
  # GET /documento_de_compras/1.json
  def show
  end

  # GET /documento_de_compras/new
  def new
    @documento_de_compra = DocumentoDeCompra.new
  end

  # GET /documento_de_compras/1/edit
  def edit
  end

  # POST /documento_de_compras
  # POST /documento_de_compras.json
  def create
    @documento_de_compra = DocumentoDeCompra.new(documento_de_compra_params)

    respond_to do |format|
      if @documento_de_compra.save
        format.html { redirect_to @documento_de_compra, notice: 'Documento de compra was successfully created.' }
        format.json { render :show, status: :created, location: @documento_de_compra }
      else
        format.html { render :new }
        format.json { render json: @documento_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documento_de_compras/1
  # PATCH/PUT /documento_de_compras/1.json
  def update
    respond_to do |format|
      if @documento_de_compra.update(documento_de_compra_params)
        format.html { redirect_to @documento_de_compra, notice: 'Documento de compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @documento_de_compra }
      else
        format.html { render :edit }
        format.json { render json: @documento_de_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documento_de_compras/1
  # DELETE /documento_de_compras/1.json
  def destroy
    @documento_de_compra.destroy
    respond_to do |format|
      format.html { redirect_to documento_de_compras_url, notice: 'Documento de compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento_de_compra
      @documento_de_compra = DocumentoDeCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_de_compra_params
      params.require(:documento_de_compra).permit(:est_dc_cod, :ven_cod, :guia_desp_cod, :cli_cod, :doc_cob_cod, :doc_com_fecha, :doc_com_met_ent, :doc_com_met_pago, :doc_com_tipo)
    end
end
