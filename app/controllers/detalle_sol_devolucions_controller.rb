class DetalleSolDevolucionsController < ApplicationController
  before_action :set_detalle_sol_devolucion, only: [:show, :edit, :update, :destroy]

  # GET /detalle_sol_devolucions
  # GET /detalle_sol_devolucions.json
  def index
    @detalle_sol_devolucions = DetalleSolDevolucion.all
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /detalle_sol_devolucions/1
  # GET /detalle_sol_devolucions/1.json
  def show
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /detalle_sol_devolucions/new
  def new
    @detalle_sol_devolucion = DetalleSolDevolucion.new
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /detalle_sol_devolucions/1/edit
  def edit
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /detalle_sol_devolucions
  # POST /detalle_sol_devolucions.json
  def create
    @detalle_sol_devolucion = DetalleSolDevolucion.new(detalle_sol_devolucion_params)

    respond_to do |format|
      if @detalle_sol_devolucion.save
        format.html { redirect_to @detalle_sol_devolucion, notice: 'Detalle sol devolucion was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_sol_devolucion }
      else
        format.html { render :new }
        format.json { render json: @detalle_sol_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_sol_devolucions/1
  # PATCH/PUT /detalle_sol_devolucions/1.json
  def update
    respond_to do |format|
      if @detalle_sol_devolucion.update(detalle_sol_devolucion_params)
        format.html { redirect_to @detalle_sol_devolucion, notice: 'Detalle sol devolucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_sol_devolucion }
      else
        format.html { render :edit }
        format.json { render json: @detalle_sol_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_sol_devolucions/1
  # DELETE /detalle_sol_devolucions/1.json
  def destroy
    @detalle_sol_devolucion.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Detalle sol devolucion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_sol_devolucion
      @detalle_sol_devolucion = DetalleSolDevolucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_sol_devolucion_params
      params.require(:detalle_sol_devolucion).permit(:sol_dev_cod, :det_sol_dev_linea, :ins_cod, :ins_cod_prov, :det_sol_dev_cant, :det_sol_dev_precio)
    end
end
