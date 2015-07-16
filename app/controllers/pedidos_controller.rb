class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
        if current_user
      if current_user.role=='admin'
        @pedidos = Pedido.all
      else
          respond_to do |format|
            format.html { redirect_to :root, notice: 'Tu cuenta debe ser de tipo administrador.' }
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: 'Debes ser administrador.' }
      end
    end 
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
        if current_user
      if current_user.role=='admin'
      else
          respond_to do |format|
            format.html { redirect_to :root, notice: 'Tu cuenta debe ser de tipo administrador.' }
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: 'Debes ser administrador.' }
      end
    end 
  end

  # GET /pedidos/new
  def new
    
            if current_user
      if current_user.role=='admin'
        @pedido = Pedido.new
      else
          respond_to do |format|
            format.html { redirect_to :root, notice: 'Tu cuenta debe ser de tipo administrador.' }
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: 'Debes ser administrador.' }
      end
    end 
  end

  # GET /pedidos/1/edit
  def edit
            if current_user
      if current_user.role=='admin'
      else
          respond_to do |format|
            format.html { redirect_to :root, notice: 'Tu cuenta debe ser de tipo administrador.' }
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: 'Debes ser administrador.' }
      end
    end 
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    #@pedido.update(estado_ped_cod:1)
    #@pedido.save
    @pedido.detalle_pedidos.length.times do |i|
      @instancia=Instanci.where(ins_cod: @pedido.detalle_pedidos[i].ins_cod).take
      @pedido.detalle_pedidos[i].ins_cod_prov=@instancia.ins_cod_prov
      @pedido.detalle_pedidos[i].det_ped_linea=i+1
      @pedido.detalle_pedidos[i].det_ped_precio=@instancia.ins_precio_prov*@pedido.detalle_pedidos[i].det_ped_cant
    end
    #@guiadesp=GuiaDespachoPedido.create(ped_cod: @pedido.ped_cod)
    #@pedido.update(guia_desp_ped_cod: @guiadesp.guia_desp_ped_cod)
    #@guiadesp.save

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedidos_url, notice: 'Pedido creado' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update

    respond_to do |format|
    # @pedido.detalle_pedidos.length.times do |i|
    #   @instancia=Instanci.where(ins_cod: @pedido.detalle_pedidos[i].ins_cod).take
    #   @pedido.detalle_pedidos[i].ins_cod_prov=@instancia.ins_cod_prov
    #   @pedido.detalle_pedidos[i].det_ped_precio=@instancia.ins_precio_prov*@pedido.detalle_pedidos[i].det_ped_cant
    #   @pedido.detalle_pedidos[i].save
    # end
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido actualizado' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.guia_desp_ped_cod=nil
    @pedido.save
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:estado_ped_cod, :guia_desp_ped_cod, :pro_cod, :ped_fecha, 
        detalle_pedidos_attributes:[:ped_cod, :det_ped_linea, :ins_cod, :ins_cod_prov, :det_ped_cant, :det_ped_precio, :_destroy])
    end
end
