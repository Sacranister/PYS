class SolicitudDevolucionsController < ApplicationController
  before_action :set_solicitud_devolucion, only: [:show, :edit, :update, :destroy]

  # GET /solicitud_devolucions
  # GET /solicitud_devolucions.json
  def index
    @solicitud_devolucions = SolicitudDevolucion.all
  end

  # GET /solicitud_devolucions/1
  # GET /solicitud_devolucions/1.json
  def show
  end

  # GET /solicitud_devolucions/new
  def new
    @solicitud_devolucion = SolicitudDevolucion.new
  end

  # GET /solicitud_devolucions/1/edit
  def edit
  end

  # POST /solicitud_devolucions
  # POST /solicitud_devolucions.json
  def create
    @solicitud_devolucion = SolicitudDevolucion.new(solicitud_devolucion_params)

    respond_to do |format|
      if @solicitud_devolucion.save
        format.html { redirect_to @solicitud_devolucion, notice: 'Solicitud devolucion was successfully created.' }
        format.json { render :show, status: :created, location: @solicitud_devolucion }
      else
        format.html { render :new }
        format.json { render json: @solicitud_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitud_devolucions/1
  # PATCH/PUT /solicitud_devolucions/1.json
  def update
    respond_to do |format|
      if @solicitud_devolucion.update(solicitud_devolucion_params)
        format.html { redirect_to @solicitud_devolucion, notice: 'Solicitud devolucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitud_devolucion }
      else
        format.html { render :edit }
        format.json { render json: @solicitud_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitud_devolucions/1
  # DELETE /solicitud_devolucions/1.json
  def destroy
    @solicitud_devolucion.destroy
    respond_to do |format|
      format.html { redirect_to solicitud_devolucions_url, notice: 'Solicitud devolucion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud_devolucion
      @solicitud_devolucion = SolicitudDevolucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_devolucion_params
      params.require(:solicitud_devolucion).permit(:not_cre_cod, :doc_com_cod, :ven_cod, :cli_cod, :sol_dev_comentario, :sol_dev_est)
    end
end
