class HistorialEstadoPedidosController < ApplicationController
  before_action :set_historial_estado_pedido, only: [:show, :edit, :update, :destroy]

  # GET /historial_estado_pedidos
  # GET /historial_estado_pedidos.json
  def index
    @historial_estado_pedidos = HistorialEstadoPedido.all
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /historial_estado_pedidos/1
  # GET /historial_estado_pedidos/1.json
  def show
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /historial_estado_pedidos/new
  def new
    @historial_estado_pedido = HistorialEstadoPedido.new
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /historial_estado_pedidos/1/edit
  def edit
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /historial_estado_pedidos
  # POST /historial_estado_pedidos.json
  def create
    @historial_estado_pedido = HistorialEstadoPedido.new(historial_estado_pedido_params)

    respond_to do |format|
      if @historial_estado_pedido.save
        format.html { redirect_to @historial_estado_pedido, notice: 'Historial estado pedido was successfully created.' }
        format.json { render :show, status: :created, location: @historial_estado_pedido }
      else
        format.html { render :new }
        format.json { render json: @historial_estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historial_estado_pedidos/1
  # PATCH/PUT /historial_estado_pedidos/1.json
  def update
    respond_to do |format|
      if @historial_estado_pedido.update(historial_estado_pedido_params)
        format.html { redirect_to @historial_estado_pedido, notice: 'Historial estado pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @historial_estado_pedido }
      else
        format.html { render :edit }
        format.json { render json: @historial_estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historial_estado_pedidos/1
  # DELETE /historial_estado_pedidos/1.json
  def destroy
    @historial_estado_pedido.destroy
    respond_to do |format|
      format.html { redirect_to historial_estado_pedidos_url, notice: 'Historial estado pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_estado_pedido
      @historial_estado_pedido = HistorialEstadoPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historial_estado_pedido_params
      params.require(:historial_estado_pedido).permit(:ped_cod, :estado_ped_cod, :hist_est_ped_cod, :hist_est_ped_fecha)
    end
end
