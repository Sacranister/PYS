class PropiedadValorsController < ApplicationController
  before_action :set_propiedad_valor, only: [:show, :edit, :update, :destroy]

  # GET /propiedad_valors
  # GET /propiedad_valors.json
  def index
    @propiedad_valors = PropiedadValor.all
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /propiedad_valors/1
  # GET /propiedad_valors/1.json
  def show
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /propiedad_valors/new
  def new
    @propiedad_valor = PropiedadValor.new
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /propiedad_valors/1/edit
  def edit
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /propiedad_valors
  # POST /propiedad_valors.json
  def create
    @propiedad_valor = PropiedadValor.new(propiedad_valor_params)

    respond_to do |format|
      if @propiedad_valor.save
        format.html { redirect_to @propiedad_valor, notice: 'Propiedad valor was successfully created.' }
        format.json { render :show, status: :created, location: @propiedad_valor }
      else
        format.html { render :new }
        format.json { render json: @propiedad_valor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /propiedad_valors/1
  # PATCH/PUT /propiedad_valors/1.json
  def update
    respond_to do |format|
      if @propiedad_valor.update(propiedad_valor_params)
        format.html { redirect_to @propiedad_valor, notice: 'Propiedad valor was successfully updated.' }
        format.json { render :show, status: :ok, location: @propiedad_valor }
      else
        format.html { render :edit }
        format.json { render json: @propiedad_valor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /propiedad_valors/1
  # DELETE /propiedad_valors/1.json
  def destroy
    @propiedad_valor.destroy
    respond_to do |format|
      format.html { redirect_to propiedad_valors_url, notice: 'Propiedad valor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_propiedad_valor
      @propiedad_valor = PropiedadValor.find(params[:prop_val_cod])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def propiedad_valor_params
      params.require(:propiedad_valor).permit(:val_cod, :prop_cod)
    end
end
