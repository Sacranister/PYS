class EstadoDcsController < ApplicationController
  before_action :set_estado_dc, only: [:show, :edit, :update, :destroy]

  # GET /estado_dcs
  # GET /estado_dcs.json
  def index
    @estado_dcs = EstadoDc.all
  end

  # GET /estado_dcs/1
  # GET /estado_dcs/1.json
  def show
  end

  # GET /estado_dcs/new
  def new
    @estado_dc = EstadoDc.new
  end

  # GET /estado_dcs/1/edit
  def edit
  end

  # POST /estado_dcs
  # POST /estado_dcs.json
  def create
    @estado_dc = EstadoDc.new(estado_dc_params)

    respond_to do |format|
      if @estado_dc.save
        format.html { redirect_to @estado_dc, notice: 'Estado dc was successfully created.' }
        format.json { render :show, status: :created, location: @estado_dc }
      else
        format.html { render :new }
        format.json { render json: @estado_dc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_dcs/1
  # PATCH/PUT /estado_dcs/1.json
  def update
    respond_to do |format|
      if @estado_dc.update(estado_dc_params)
        format.html { redirect_to @estado_dc, notice: 'Estado dc was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_dc }
      else
        format.html { render :edit }
        format.json { render json: @estado_dc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_dcs/1
  # DELETE /estado_dcs/1.json
  def destroy
    @estado_dc.destroy
    respond_to do |format|
      format.html { redirect_to estado_dcs_url, notice: 'Estado dc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_dc
      @estado_dc = EstadoDc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_dc_params
      params.require(:estado_dc).permit(:est_dc_nom)
    end
end
