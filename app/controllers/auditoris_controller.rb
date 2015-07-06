class AuditorisController < ApplicationController
  before_action :set_auditori, only: [:show, :edit, :update, :destroy]

  # GET /auditoris
  # GET /auditoris.json
  def index
    @auditoris = Auditori.all
  end

  # GET /auditoris/1
  # GET /auditoris/1.json
  def show
  end

  # GET /auditoris/new
  def new
    @auditori = Auditori.new
  end

  # GET /auditoris/1/edit
  def edit
  end

  # POST /auditoris
  # POST /auditoris.json
  def create
    @auditori = Auditori.new(auditori_params)

    respond_to do |format|
      if @auditori.save
        format.html { redirect_to @auditori, notice: 'Auditori was successfully created.' }
        format.json { render :show, status: :created, location: @auditori }
      else
        format.html { render :new }
        format.json { render json: @auditori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auditoris/1
  # PATCH/PUT /auditoris/1.json
  def update
    respond_to do |format|
      if @auditori.update(auditori_params)
        format.html { redirect_to @auditori, notice: 'Auditori was successfully updated.' }
        format.json { render :show, status: :ok, location: @auditori }
      else
        format.html { render :edit }
        format.json { render json: @auditori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auditoris/1
  # DELETE /auditoris/1.json
  def destroy
    @auditori.destroy
    respond_to do |format|
      format.html { redirect_to auditoris_url, notice: 'Auditori was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auditori
      @auditori = Auditori.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auditori_params
      params.require(:auditori).permit(:aud_usuario, :aud_fecha, :aud_tabla_modif, :aud_operacion, :aud_atri_modif, :aud_antes, :aud_despues)
    end
end
