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
  end

  # POST /propiedads
  # POST /propiedads.json
  def create
    @propiedad = Propiedad.new(propiedad_params)
    respond_to do |format|
    if @propiedad.save
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
