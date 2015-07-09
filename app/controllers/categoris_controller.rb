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
        format.html { redirect_to @categori, notice: 'Categori was successfully created.' }
        format.json { render :show, status: :created, location: @categori }
      else
        format.html { render :new }
        format.json { render json: @categori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoris/1
  # PATCH/PUT /categoris/1.json
  def update
    respond_to do |format|
      if @categori.update(categori_params)
        format.html { redirect_to @categori, notice: 'Categori was successfully updated.' }
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
      format.html { redirect_to categoris_url, notice: 'Categori was successfully destroyed.' }
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
