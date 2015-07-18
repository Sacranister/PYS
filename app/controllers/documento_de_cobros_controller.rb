class DocumentoDeCobrosController < ApplicationController
  before_action :set_documento_de_cobro, only: [:show, :edit, :update, :destroy]

  # GET /documento_de_cobros
  # GET /documento_de_cobros.json
  def index
    @documento_de_cobros = DocumentoDeCobro.all
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /documento_de_cobros/1
  # GET /documento_de_cobros/1.json
  def show
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /documento_de_cobros/new
  def new
    @documento_de_cobro = DocumentoDeCobro.new
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /documento_de_cobros/1/edit
  def edit
              respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /documento_de_cobros
  # POST /documento_de_cobros.json
  def create
    @documento_de_cobro = DocumentoDeCobro.new(documento_de_cobro_params)

    respond_to do |format|
      if @documento_de_cobro.save
        format.html { redirect_to @documento_de_cobro, notice: 'Documento de cobro was successfully created.' }
        format.json { render :show, status: :created, location: @documento_de_cobro }
      else
        format.html { render :new }
        format.json { render json: @documento_de_cobro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documento_de_cobros/1
  # PATCH/PUT /documento_de_cobros/1.json
  def update
    respond_to do |format|
      if @documento_de_cobro.update(documento_de_cobro_params)
        format.html { redirect_to @documento_de_cobro, notice: 'Documento de cobro was successfully updated.' }
        format.json { render :show, status: :ok, location: @documento_de_cobro }
      else
        format.html { render :edit }
        format.json { render json: @documento_de_cobro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documento_de_cobros/1
  # DELETE /documento_de_cobros/1.json
  def destroy
    @documento_de_cobro.destroy
    respond_to do |format|
      format.html { redirect_to documento_de_cobros_url, notice: 'Documento de cobro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento_de_cobro
      @documento_de_cobro = DocumentoDeCobro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_de_cobro_params
      params.require(:documento_de_cobro).permit(:not_cre_cod, :doc_com_cod, :doc_cob_tipo)
    end
end
