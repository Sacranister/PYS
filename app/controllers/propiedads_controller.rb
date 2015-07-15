class PropiedadsController < ApplicationController
  before_action :set_propiedad, only: [:show, :edit, :update, :destroy]

  # GET /propiedads
  # GET /propiedads.json
  def index
    @propiedads = Propiedad.all
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

  # GET /propiedads/1
  # GET /propiedads/1.json
  def show
  end

  # GET /propiedads/new
  def new
    @propiedad = Propiedad.new
  end

  # GET /propiedads/1/edit
  def edit
    #@propiedad.propiedad_valors.build.build_valor
  end

  # POST /propiedads
  # POST /propiedads.json
  def create
    @propiedad = Propiedad.new(propiedad_params)
    respond_to do |format|
    if @propiedad.save
      @propiedad.propiedad_valors.each do |pv|
        @valores=[]
        @valores=Valor.where(val_nom: pv.valor.val_nom)
        if @valores.length>0
        @valores.each do |valor|
          if valor.val_nom==pv.valor.val_nom && valor.val_cod !=pv.val_cod
            @valborrar=Valor.where(val_cod: pv.val_cod).take
            @pvnuevo=PropiedadValor.new
            @pvnuevo.prop_val_cod=pv.prop_val_cod
            @pvnuevo.prop_cod=pv.prop_cod
            @pvnuevo.val_cod=valor.val_cod
            @valborrar.destroy
            @pvnuevo.save
            end
          end
        end
      end
        format.html { redirect_to @propiedad, notice: 'Propiedad was successfully created.' }
        format.json { render :show, status: :created, location: @propiedad }
      else
        format.html { render :new }
        format.json { render json: @propiedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /propiedads/1
  # PATCH/PUT /propiedads/1.json
  def update
    respond_to do |format|
      if @propiedad.update(propiedad_params)
        @aux=[]
        @propiedad.propiedad_valors.each do |pv|
          if @aux.include?(pv.valor.val_nom)
            @valor=Valor.where(val_cod: pv.valor.val_cod).take
            @valor.destroy
          else
            @aux.push(pv.valor.val_nom)
          end
        end
        format.html { redirect_to @propiedad, notice: 'Propiedad was successfully updated.' }
        format.json { render :show, status: :ok, location: @propiedad }
      else
        format.html { render :edit }
        format.json { render json: @propiedad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /propiedads/1
  # DELETE /propiedads/1.json
  def destroy
    @propiedad.destroy
    respond_to do |format|
      format.html { redirect_to propiedads_url, notice: 'Propiedad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def valor_attributes=(attributes)
   self.valor << Valor.where(attributes).first_or_initialize
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_propiedad
      @propiedad = Propiedad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def propiedad_params
      params.require(:propiedad).permit(:prop_nom, propiedad_valors_attributes: [:prop_val_cod, :_destroy, valor_attributes:[:val_cod, :val_nom, :_destroy]])
    end
end
