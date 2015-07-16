class InstancisController < ApplicationController
  before_action :set_instanci, only: [:show, :edit, :update, :destroy]

  # GET /instancis
  # GET /instancis.json
  def index
        if current_user
      if current_user.role=='admin'
        @instancis = Instanci.all
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

  # GET /instancis/1
  # GET /instancis/1.json
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

  # GET /instancis/new
  def new
            if current_user
      if current_user.role=='admin'
            @instanci = Instanci.new
    @instanci.build_articulo.art_prop_vals.build
    @instanci.imagens.build
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

  # GET /instancis/1/edit
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

  def copy
    if current_user
      if current_user.role=='admin'
        @source = Instanci.find(params[:id])
        @instanci = @source.dup
        render 'copy'
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

  # POST /instancis
  # POST /instancis.json
  def create
    @instanci = Instanci.new(instanci_params)
    if @instanci.imagens[0]!=nil
      @instanci.imagens[0].ins_cod_prov=@instanci.ins_cod_prov
    end
    @instancias=Instanci.where(ins_cod_prov: @instanci.ins_cod_prov)
    respond_to do |format|
      if @instanci.save
        if @instanci.imagens[0]!=nil
          if @instanci.imagens[0].imagen_uri==""
            @instanci.imagens[0].destroy
          end
        end    
        @articulos=[]
        @instancias.each do |i|
          @articulos=@articulos+Articulo.where(art_nom: @instanci.articulo.art_nom, art_cod: i.art_cod)
        end
        if(@articulos.length>1)
          @articulos.each do |articulo|
            if(articulo.art_cod!=@instanci.art_cod)
              @instancia=Instanci.new
              @instancia.ins_cod=@instanci.ins_cod
              @instancia.ins_cod_prov=@instanci.ins_cod_prov
              @instancia.est_art_cod=@instanci.est_art_cod
              @instancia.art_cod=articulo.art_cod
              @instancia.ins_stock=@instanci.ins_stock
              @instancia.ins_precio_lista=@instanci.ins_precio_lista
              @instancia.ins_precio_prov=@instanci.ins_precio_prov
              @auxart=@instanci.art_cod
              @instanci.destroy         
              @instancia.save
              @artpropvals=ArtPropVal.where(art_cod: @auxart)
              @artpropvals.each do |apvs|
                @temp=0
                @apv=ArtPropVal.new
                @apv.apv_cod=apvs.apv_cod
                @apv.art_cod=articulo.art_cod
                @apv.prop_cod=apvs.prop_cod
                @apv.val_cod=apvs.val_cod
                @otrapvs=ArtPropVal.where(art_cod: articulo.art_cod)
                @otrapvs.each do |oapv|
                  if oapv.prop_cod==apvs.prop_cod && oapv.val_cod==apvs.val_cod
                    @apv.apv_cod=oapv.apv_cod
                    @temp=1
                    break
                  end
                end
                @insapv=InsApv.new
                @insapv.ins_cod=@instancia.ins_cod
                @insapv.ins_cod_prov=@instancia.ins_cod_prov
                @insapv.apv_cod=@apv.apv_cod
                @auxapv=ArtPropVal.where(apv_cod: apvs.apv_cod).take
                @auxapv.destroy
                if @temp==0
                  @apv.save
                end
                @insapv.save
              end
            end
          end
          @art=Articulo.where(art_cod: @auxart).take
          @art.destroy
        else
          @ins_cod_prov=@instanci.ins_cod_prov
          @ins_cod=@instanci.ins_cod
          @instanci.articulo.art_prop_vals.each do |apv|
            @insapv=InsApv.new
            @insapv.ins_cod=@ins_cod
            @insapv.ins_cod_prov=@ins_cod_prov
            @insapv.apv_cod=apv.apv_cod
            @insapv.save
            @ap=ArtProp.new
            @ap.art_cod=apv.art_cod
            @ap.prop_cod=apv.prop_cod
            @ap.save
          end
        end
        format.html { redirect_to instancis_path, notice: 'Instanci was successfully created.' }
        format.json { render :show, status: :created, location: @instanci }
      else
        format.html { render :new }
        format.json { render json: @instanci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instancis/1
  # PATCH/PUT /instancis/1.json
  def update
    respond_to do |format|
      if @instanci.update(instanci_params)
        format.html { redirect_to instancis_path, notice: 'Instanci was successfully updated.' }
        format.json { render :show, status: :ok, location: @instanci }
      else
        format.html { render :edit }
        format.json { render json: @instanci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instancis/1
  # DELETE /instancis/1.json
  def destroy
    @instanci.destroy
    respond_to do |format|
      format.html { redirect_to instancis_url, notice: 'Instanci was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instanci
      @instanci = Instanci.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instanci_params
           params.require(:instanci).permit(:ins_cod,:art_cod, :ins_cod_prov, :est_art_cod, :ins_stock, 
        :ins_precio_lista, :ins_precio_prov, :_destroy, 
        {articulo_attributes:[:art_cod, :art_nom, :cat_cod, :_destroy, 
          art_prop_vals_attributes: [:apv_cod, :val_cod, :prop_cod, :_destroy]]},{imagens_attributes: [
            :imagen_cod, :imagen_uri, :ins_cod_prov]})
    end
end
