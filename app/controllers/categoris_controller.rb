class CategorisController < ApplicationController
  before_action :set_categori, only: [:show, :edit, :update, :destroy]

  # GET /categoris
  # GET /categoris.json
  def index
    @categoris = Categori.all
  end

  # GET /categoris/1
  # GET /categoris/1.json
def buscarart(cat_id)
    @categoris=Categori.where(cat_cat_cod: cat_id)
      @categoris.each do |cat|
      @articulos = Articulo.where(cat_cod: cat.cat_cod)
      @articulos.each do |articulo|    
        @imagenes.each do |imagen|
          @instancis=@instancis+(Instanci.where(ins_cod_prov: imagen.ins_cod_prov, art_cod: articulo.art_cod))
        end
      end
      buscarart(cat.cat_cod)
    end
  end
  def show
    @instancis=[]
    @articulos = Articulo.where(cat_cod: @categori.id)
    @imagenes=Imagen.where("LENGTH(imagen_uri) > ?",0)
    @articulos.each do |articulo|    
      @imagenes.each do |imagen|
        @instancis=@instancis+(Instanci.where(ins_cod_prov: imagen.ins_cod_prov, art_cod: articulo.art_cod))
      end
    end
    buscarart(@categori.id)
  end

  # GET /categoris/new
  def new
    @categori = Categori.new
  end

  # GET /categoris/1/edit
  def edit
  end

  # POST /categoris
  # POST /categoris.json
  def create
    @categori = Categori.new(categori_params)

    respond_to do |format|
      if @categori.save
        format.html { redirect_to @categori, notice: 'La categoría se creo correctamente' }
        format.json { render :show, status: :created, location: @categori }
      else
        format.html { render :new }
        format.json { render json: @categori.errors, status: :unprocessable_entity }
      end
    end
  end

def add
  @val=params[:val]
  if current_user && current_user.role=='cliente'
    @instanci=Instanci.where(ins_cod: @val).take
    @clientes=Cliente.where(cli_mail: current_user.email ).take
    @documento_de_compra=DocumentoDeCompra.where(cli_cod: @clientes.cli_cod, est_dc_cod: 1).take
    if(@documento_de_compra.blank?)
      @dcob=DocumentoDeCobro.create
      @cliente=Cliente.where(cli_mail: current_user.email,).take
      @documento_de_compra = DocumentoDeCompra.create(est_dc_cod: 1,cli_cod: @cliente.cli_cod,doc_cob_cod: @dcob.doc_cob_cod)
      @dcob.update(doc_com_cod: @documento_de_compra.doc_com_cod)
    end
    @det=DetalleDocumentoDeCompra.where(doc_com_cod: @documento_de_compra.doc_com_cod)
    if @det.blank?
        if(@instanci.ins_stock<1)
          respond_to do |format|
            format.html { redirect_to :back, notice: 'no hay suficiente stock' }
          end
          return
        else
          DetalleDocumentoDeCompra.create(doc_com_cod: @documento_de_compra.doc_com_cod,det_doc_com_linea: 1, ins_cod: @val,det_doc_com_cant:1, ins_cod_prov: @instanci.ins_cod_prov,det_doc_com_precio: @instanci.ins_precio_lista, det_doc_com_precio_uni:@instanci.ins_precio_lista )
        end
    else
      @inst=@det.where(ins_cod: @val).take
      @detlin=@det.order(det_doc_com_linea: :desc).take
      if @inst.blank?
        if(@instanci.ins_stock<1)
          respond_to do |format|
            format.html { redirect_to :back, notice: 'no hay suficiente stock' }
          end
          return
        else
          DetalleDocumentoDeCompra.create(doc_com_cod: @documento_de_compra.doc_com_cod,det_doc_com_linea: @detlin.det_doc_com_linea+1,det_doc_com_cant:1, ins_cod: @val, ins_cod_prov: @instanci.ins_cod_prov,det_doc_com_precio: @instanci.ins_precio_lista, det_doc_com_precio_uni:@instanci.ins_precio_lista )
          end
      else
        if(@instanci.ins_stock)<(@inst.det_doc_com_cant+1)
            respond_to do |format|
              format.html { redirect_to :back, notice: 'no hay suficiente stock' }
            end
            return
        else
          @asd=@inst.det_doc_com_cant+1
          @inst.update(det_doc_com_cant:@asd,det_doc_com_precio:(@asd*@inst.det_doc_com_precio_uni))
        end
      end
    end
      respond_to do |format|
        format.html { redirect_to :back, notice: 'Se ha agregado al carro' }
      end
  end
end
  # PATCH/PUT /categoris/1
  # PATCH/PUT /categoris/1.json
  def update
    respond_to do |format|
      if @categori.update(categori_params)
        format.html { redirect_to @categori, notice: 'La categoría se actualizo correctamente' }
        format.json { render :show, status: :ok, location: @categori }
      else
        format.html { render :edit }
        format.json { render json: @categori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoris/1
  # DELETE /categoris/1.json
  def destroy
    @categori.destroy
    respond_to do |format|
      format.html { redirect_to categoris_url, notice: 'La categoría se elimino correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categori
      @categori = Categori.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categori_params
      params.require(:categori).permit(:cat_cat_cod, :cat_nom)
    end
end
