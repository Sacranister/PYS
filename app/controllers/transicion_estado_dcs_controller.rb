class TransicionEstadoDcsController < ApplicationController
  before_action :set_transicion_estado_dc, only: [:show, :edit, :update, :destroy]

  # GET /transicion_estado_dcs
  # GET /transicion_estado_dcs.json
  def index
    @transicion_estado_dcs = TransicionEstadoDc.all
  end

  # GET /transicion_estado_dcs/1
  # GET /transicion_estado_dcs/1.json
  def show
  end

  # GET /transicion_estado_dcs/new
  def new
    @transicion_estado_dc = TransicionEstadoDc.new
  end

  # GET /transicion_estado_dcs/1/edit
  def edit
  end

  # POST /transicion_estado_dcs
  # POST /transicion_estado_dcs.json
  def create
    @transicion_estado_dc = TransicionEstadoDc.new(transicion_estado_dc_params)

    respond_to do |format|
      if @transicion_estado_dc.save
        format.html { redirect_to @transicion_estado_dc, notice: 'Transicion estado dc was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_estado_dc }
      else
        format.html { render :new }
        format.json { render json: @transicion_estado_dc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_estado_dcs/1
  # PATCH/PUT /transicion_estado_dcs/1.json
  def update
    respond_to do |format|
      if @transicion_estado_dc.update(transicion_estado_dc_params)
        format.html { redirect_to @transicion_estado_dc, notice: 'Transicion estado dc was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_estado_dc }
      else
        format.html { render :edit }
        format.json { render json: @transicion_estado_dc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_estado_dcs/1
  # DELETE /transicion_estado_dcs/1.json
  def destroy
    @transicion_estado_dc.destroy
    respond_to do |format|
      format.html { redirect_to transicion_estado_dcs_url, notice: 'Transicion estado dc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_estado_dc
      @transicion_estado_dc = TransicionEstadoDc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_estado_dc_params
      params.require(:transicion_estado_dc).permit(:est_est_dc_cod, :est_dc_cod, :trans_est_dc_cod)
    end
end
