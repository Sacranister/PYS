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
    if current_user
       
      @clientess=Cliente.where(cli_mail: current_user.email).take
      if ((current_user && current_user.role=='admin') || (current_user && (@clientess.cli_cod == @documento_de_compra.cli_cod)))
      else
          respond_to do |format|
            format.html { redirect_to :root, notice: 'No estas autorizado para ver esta pagina' }
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: 'No estas autorizado para ver esta pagina.' }
      end
    end 

  end
def pagar 
  if (current_user && current_user.role=='cliente')
    @cliente=Cliente.where(cli_mail: current_user.email).take
    @documento_de_comprass=DocumentoDeCompra.where(cli_cod: @cliente.cli_cod, est_dc_cod:1).take
    @documento_de_comprass.doc_com_met_pago='Transferencia bancaria'
    @documento_de_comprass.doc_com_tipo='Orden de compra'
    @documento_de_comprass.save
  else
    respond_to do |format|
        format.html { redirect_to :root , notice: 'Debes ingresar con tu cuenta primero' }

    end
  end
end
  # GET /documento_de_compras/new
  def new
    @documento_de_compra = DocumentoDeCompra.new
  end

  # GET /documento_de_compras/1/edit
  def edit
  end


def pagar_cuenta
  @cliente=Cliente.where(cli_mail: current_user.email).take
  @documento_de_comprass=DocumentoDeCompra.where(cli_cod: @cliente.cli_cod, est_dc_cod:1).take
  @documento_de_comprass.update(documento_de_compra_params)
  @documento_de_comprass.est_dc_cod=2

  if @documento_de_comprass.save
    @detalles=DetalleDocumentoDeCompra.where(doc_com_cod: @documento_de_comprass.doc_com_cod)
    @detalles.each do |linea|
      @instancia=Instanci.where(ins_cod: linea.ins_cod).take
      @instancia.update(ins_stock: @instancia.ins_stock-linea.det_doc_com_cant)
    end
    respond_to do |format|
        format.html { redirect_to @documento_de_comprass, notice: '' }
      end
    end
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
        format.html { redirect_to @documento_de_compra, notice: '' }
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
