class InstancisController < ApplicationController
  before_action :set_instanci, only: [:show, :edit, :update, :destroy]

  # GET /instancis
  # GET /instancis.json
  def index
    @instancis = Instanci.all
  end

  # GET /instancis/1
  # GET /instancis/1.json
  def show
  end

  # GET /instancis/new
  def new
    @instanci = Instanci.new
    @instanci.build_articulo.art_prop_vals.build.ins_apvs.build
  end

  # GET /instancis/1/edit
  def edit
  end

   def copy
        @source = Instanci.find(params[:id])
        @instanci = @source.dup
        render 'copy'
      end

  # POST /instancis
  # POST /instancis.json
  def create
    @instanci = Instanci.new(instanci_params)

    respond_to do |format|
      if @instanci.save
        format.html { redirect_to instancis_path, notice: 'Instanci was successfully created.' }
        format.json { render :show, status: :created, location: @instanci }
      else
        format.html { render :new }
        format.json { render json: @instanci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instancis/1
  # PATCH/PUT /instancis/1.json
  def update
    respond_to do |format|
      if @instanci.update(instanci_params)
        format.html { redirect_to @instanci, notice: 'Instanci was successfully updated.' }
        format.json { render :show, status: :ok, location: @instanci }
      else
        format.html { render :edit }
        format.json { render json: @instanci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instancis/1
  # DELETE /instancis/1.json
  def destroy
    @instanci.destroy
    respond_to do |format|
      format.html { redirect_to instancis_url, notice: 'Instanci was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instanci
      @instanci = Instanci.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instanci_params
      params.require(:instanci).permit(:art_cod, :ins_cod_prov, :est_art_cod, :ins_stock, 
        :ins_precio_lista, :ins_precio_prov, :_destroy, 
        articulo_attributes:[:art_cod, :art_nom, :cat_cod, :_destroy, 
          art_prop_vals_attributes: [:apv_cod, :val_cod, :prop_cod, :_destroy, 
            ins_apvs_attributes:[:ins_apvs_cod, :ins_cod_prov]]])
    end
end
