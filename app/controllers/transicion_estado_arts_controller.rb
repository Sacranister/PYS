class TransicionEstadoArtsController < ApplicationController
  before_action :set_transicion_estado_art, only: [:show, :edit, :update, :destroy]

  # GET /transicion_estado_arts
  # GET /transicion_estado_arts.json
  def index
    @transicion_estado_arts = TransicionEstadoArt.all
    respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /transicion_estado_arts/1
  # GET /transicion_estado_arts/1.json
  def show
     respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /transicion_estado_arts/new
  def new
    @transicion_estado_art = TransicionEstadoArt.new
     respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /transicion_estado_arts/1/edit
  def edit
     respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /transicion_estado_arts
  # POST /transicion_estado_arts.json
  def create
    @transicion_estado_art = TransicionEstadoArt.new(transicion_estado_art_params)

    respond_to do |format|
      if @transicion_estado_art.save
        format.html { redirect_to @transicion_estado_art, notice: 'Transicion estado art was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_estado_art }
      else
        format.html { render :new }
        format.json { render json: @transicion_estado_art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_estado_arts/1
  # PATCH/PUT /transicion_estado_arts/1.json
  def update
    respond_to do |format|
      if @transicion_estado_art.update(transicion_estado_art_params)
        format.html { redirect_to @transicion_estado_art, notice: 'Transicion estado art was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_estado_art }
      else
        format.html { render :edit }
        format.json { render json: @transicion_estado_art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_estado_arts/1
  # DELETE /transicion_estado_arts/1.json
  def destroy
    @transicion_estado_art.destroy
    respond_to do |format|
      format.html { redirect_to transicion_estado_arts_url, notice: 'Transicion estado art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_estado_art
      @transicion_estado_art = TransicionEstadoArt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_estado_art_params
      params.require(:transicion_estado_art).permit(:est_est_art_cod, :est_art_cod, :trans_est_art_cod)
    end
end
