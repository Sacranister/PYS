class EstadoPedidosController < ApplicationController
  before_action :set_estado_pedido, only: [:show, :edit, :update, :destroy]

  # GET /estado_pedidos
  # GET /estado_pedidos.json
  def index
    @estado_pedidos = EstadoPedido.all
  end

  # GET /estado_pedidos/1
  # GET /estado_pedidos/1.json
  def show
  end

  # GET /estado_pedidos/new
  def new
    @estado_pedido = EstadoPedido.new
  end

  # GET /estado_pedidos/1/edit
  def edit
  end

  # POST /estado_pedidos
  # POST /estado_pedidos.json
  def create
    @estado_pedido = EstadoPedido.new(estado_pedido_params)

    respond_to do |format|
      if @estado_pedido.save
        format.html { redirect_to @estado_pedido, notice: 'Estado pedido was successfully created.' }
        format.json { render :show, status: :created, location: @estado_pedido }
      else
        format.html { render :new }
        format.json { render json: @estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_pedidos/1
  # PATCH/PUT /estado_pedidos/1.json
  def update
    respond_to do |format|
      if @estado_pedido.update(estado_pedido_params)
        format.html { redirect_to @estado_pedido, notice: 'Estado pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_pedido }
      else
        format.html { render :edit }
        format.json { render json: @estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_pedidos/1
  # DELETE /estado_pedidos/1.json
  def destroy
    @estado_pedido.destroy
    respond_to do |format|
      format.html { redirect_to estado_pedidos_url, notice: 'Estado pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_pedido
      @estado_pedido = EstadoPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_pedido_params
      params.require(:estado_pedido).permit(:estado_ped_nom)
    end
end
