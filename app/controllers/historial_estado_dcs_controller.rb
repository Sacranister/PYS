class HistorialEstadoDcsController < ApplicationController
  before_action :set_historial_estado_dc, only: [:show, :edit, :update, :destroy]

  # GET /historial_estado_dcs
  # GET /historial_estado_dcs.json
  def index
    @historial_estado_dcs = HistorialEstadoDc.all
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /historial_estado_dcs/1
  # GET /historial_estado_dcs/1.json
  def show
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /historial_estado_dcs/new
  def new
    @historial_estado_dc = HistorialEstadoDc.new
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /historial_estado_dcs/1/edit
  def edit
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /historial_estado_dcs
  # POST /historial_estado_dcs.json
  def create
    @historial_estado_dc = HistorialEstadoDc.new(historial_estado_dc_params)

    respond_to do |format|
      if @historial_estado_dc.save
        format.html { redirect_to @historial_estado_dc, notice: 'Historial estado dc was successfully created.' }
        format.json { render :show, status: :created, location: @historial_estado_dc }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_dc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_dcs/1
  # PATCH/PUT /historial_estado_dcs/1.json
  def update
    respond_to do |format|
      if @historial_estado_dc.update(historial_estado_dc_params)
        format.html { redirect_to @historial_estado_dc, notice: 'Historial estado dc was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_estado_dc }
      else
        format.html { render :edit }
        format.json { render json: @historial_estado_dc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_dcs/1
  # DELETE /historial_estado_dcs/1.json
  def destroy
    @historial_estado_dc.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_dcs_url, notice: 'Historial estado dc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_dc
      @historial_estado_dc = HistorialEstadoDc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_dc_params
      params.require(:historial_estado_dc).permit(:doc_com_cod, :est_dc_cod, :hist_est_dc_cod, :hist_est_dc_fecha)
    end
end
