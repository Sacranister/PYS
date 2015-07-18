class TransicionEstadoPedidosController < ApplicationController
  before_action :set_transicion_estado_pedido, only: [:show, :edit, :update, :destroy]

  # GET /transicion_estado_pedidos
  # GET /transicion_estado_pedidos.json
  def index
    @transicion_estado_pedidos = TransicionEstadoPedido.all
     respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /transicion_estado_pedidos/1
  # GET /transicion_estado_pedidos/1.json
  def show
     respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /transicion_estado_pedidos/new
  def new
    @transicion_estado_pedido = TransicionEstadoPedido.new
     respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /transicion_estado_pedidos/1/edit
  def edit
     respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /transicion_estado_pedidos
  # POST /transicion_estado_pedidos.json
  def create
    @transicion_estado_pedido = TransicionEstadoPedido.new(transicion_estado_pedido_params)

    respond_to do |format|
      if @transicion_estado_pedido.save
        format.html { redirect_to @transicion_estado_pedido, notice: 'Transicion estado pedido was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_estado_pedido }
      else
        format.html { render :new }
        format.json { render json: @transicion_estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_estado_pedidos/1
  # PATCH/PUT /transicion_estado_pedidos/1.json
  def update
    respond_to do |format|
      if @transicion_estado_pedido.update(transicion_estado_pedido_params)
        format.html { redirect_to @transicion_estado_pedido, notice: 'Transicion estado pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_estado_pedido }
      else
        format.html { render :edit }
        format.json { render json: @transicion_estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_estado_pedidos/1
  # DELETE /transicion_estado_pedidos/1.json
  def destroy
    @transicion_estado_pedido.destroy
    respond_to do |format|
      format.html { redirect_to transicion_estado_pedidos_url, notice: 'Transicion estado pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_estado_pedido
      @transicion_estado_pedido = TransicionEstadoPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_estado_pedido_params
      params.require(:transicion_estado_pedido).permit(:est_estado_ped_cod, :estado_ped_cod, :trans_est_ped_cod)
    end
end
