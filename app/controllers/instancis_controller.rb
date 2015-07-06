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
  end

  # GET /instancis/1/edit
  def edit
  end

  # POST /instancis
  # POST /instancis.json
  def create
    @instanci = Instanci.new(instanci_params)

    respond_to do |format|
      if @instanci.save
        format.html { redirect_to @instanci, notice: 'Instanci was successfully created.' }
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
      params.require(:instanci).permit(:ins_cod, :ins_cod_prov, :est_art_cod, :art_cod, :ins_stock, :ins_precio_lista, :ins_precio_prov)
    end
end
