class GuiaDespachoPedidosController < ApplicationController
  before_action :set_guia_despacho_pedido, only: [:show, :edit, :update, :destroy]

  # GET /guia_despacho_pedidos
  # GET /guia_despacho_pedidos.json
  def index
    @guia_despacho_pedidos = GuiaDespachoPedido.all
  end

  # GET /guia_despacho_pedidos/1
  # GET /guia_despacho_pedidos/1.json
  def show
  end

  # GET /guia_despacho_pedidos/new
  def new
    @guia_despacho_pedido = GuiaDespachoPedido.new
  end

  # GET /guia_despacho_pedidos/1/edit
  def edit
  end

  # POST /guia_despacho_pedidos
  # POST /guia_despacho_pedidos.json
  def create
    @guia_despacho_pedido = GuiaDespachoPedido.new(guia_despacho_pedido_params)

    respond_to do |format|
      if @guia_despacho_pedido.save
        format.html { redirect_to @guia_despacho_pedido, notice: 'Guia despacho pedido was successfully created.' }
        format.json { render :show, status: :created, location: @guia_despacho_pedido }
      else
        format.html { render :new }
        format.json { render json: @guia_despacho_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guia_despacho_pedidos/1
  # PATCH/PUT /guia_despacho_pedidos/1.json
  def update
    respond_to do |format|
      if @guia_despacho_pedido.update(guia_despacho_pedido_params)
        format.html { redirect_to @guia_despacho_pedido, notice: 'Guia despacho pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @guia_despacho_pedido }
      else
        format.html { render :edit }
        format.json { render json: @guia_despacho_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guia_despacho_pedidos/1
  # DELETE /guia_despacho_pedidos/1.json
  def destroy
    @guia_despacho_pedido.destroy
    respond_to do |format|
      format.html { redirect_to guia_despacho_pedidos_url, notice: 'Guia despacho pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guia_despacho_pedido
      @guia_despacho_pedido = GuiaDespachoPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guia_despacho_pedido_params
      params.require(:guia_despacho_pedido).permit(:ped_cod, :guia_desp_ped_fecha)
    end
end
