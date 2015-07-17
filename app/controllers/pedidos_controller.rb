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

    def editar
    if current_user
      if current_user.role=='admin'
        @source = Pedido.find(params[:id])
        @pedido = @source.deep_clone(:include => :detalle_pedidos)
        render 'edit'
        $ped_cod=@source.ped_cod
        $mensaje="Pedido editado"
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
        $ped_cod=@pedido.ped_cod
        $mensaje="Pedido creado"
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
        #@pedido.detalle_pedidos.build
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
    @pediant=Pedido.where(ped_cod: $ped_cod).take
    if @pediant!=nil
      @pediant.destroy
    end
    @pedido.ped_cod=$ped_cod
    @pedido.estado_ped_cod=1
    @pedido.detalle_pedidos.length.times do |i|
      @instancia=Instanci.where(ins_cod: @pedido.detalle_pedidos[i].ins_cod).take
      @pedido.detalle_pedidos[i].ins_cod_prov=@instancia.ins_cod_prov
      @pedido.detalle_pedidos[i].det_ped_linea=i+1
      @pedido.detalle_pedidos[i].det_ped_precio=@instancia.ins_precio_prov*@pedido.detalle_pedidos[i].det_ped_cant
      if @instancia.est_art_cod==1
        @instancia.update(est_art_cod: 6)
      elsif @instancia.est_art_cod==2
        @instancia.update(est_art_cod: 2)
      elsif @instancia.est_art_cod==3
        @instancia.update(est_art_cod: 3)
      elsif @instancia.est_art_cod==4
        @instancia.update(est_art_cod: 5)
      elsif @instancia.est_art_cod==5
        @instancia.update(est_art_cod: 5)
      elsif @instancia.est_art_cod==6
        @instancia.update(est_art_cod: 6)
      elsif @instancia.est_art_cod==7
        @instancia.update(est_art_cod: 7)
      elsif @instancia.est_art_cod==8
        @instancia.update(est_art_cod: 8)
      end
    end
    #@guiadesp=GuiaDespachoPedido.create(ped_cod: @pedido.ped_cod)
    #@pedido.update(guia_desp_ped_cod: @guiadesp.guia_desp_ped_cod)
    #@guiadesp.save
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedidos_url, notice: $mensaje }
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
      if @pedido.update(pedido_params)  
      @pedido.detalle_pedidos.length.times do |i|
        @instancia=Instanci.where(ins_cod: @pedido.detalle_pedidos[i].ins_cod).take
        if @instancia.est_art_cod==1 #en tienda
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 8)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 8)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        elsif @instancia.est_art_cod==2 #cotizado
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 3)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 3)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        elsif @instancia.est_art_cod==3 #pedido
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 3)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 3)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        elsif @instancia.est_art_cod==4 #agotado
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 7)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 7)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        elsif @instancia.est_art_cod==5 #agotado-cotizado
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 7)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 7)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        elsif @instancia.est_art_cod==6 #en tienda-cotizado
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 8)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 8)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        elsif @instancia.est_art_cod==7 #agotado-pedido
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 7)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 7)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        elsif @instancia.est_art_cod==8 #en tienda-pedido
          if @pedido.estado_ped_cod==2 #en tramite
            @instancia.update(est_art_cod: 8)
          elsif @pedido.estado_ped_cod==3 #despachado
            @instancia.update(est_art_cod: 8)
          elsif @pedido.estado_ped_cod==4 #recibido
            @instancia.update(est_art_cod: 1)
            @instancia.update(ins_stock: @instancia.ins_stock+@pedido.detalle_pedidos[i].det_ped_cant)
          end
        end
      end
        format.html { redirect_to pedidos_path, notice: 'Pedido actualizado' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { redirect_to pedidos_path }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.detalle_pedidos.length.times do |i|
      @instancia=Instanci.where(ins_cod: @pedido.detalle_pedidos[i].ins_cod).take
      if @instancia.est_art_cod==5
        @instancia.update(est_art_cod: 4)
      elsif @instancia.est_art_cod==6
        @instancia.update(est_art_cod: 1)
      end
    end
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
