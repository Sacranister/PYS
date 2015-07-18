class InsApvsController < ApplicationController
  before_action :set_ins_apv, only: [:show, :edit, :update, :destroy]

  # GET /ins_apvs
  # GET /ins_apvs.json
  def index
    @ins_apvs = InsApv.all
           respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /ins_apvs/1
  # GET /ins_apvs/1.json
  def show
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /ins_apvs/new
  def new
    @ins_apv = InsApv.new
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /ins_apvs/1/edit
  def edit
               respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /ins_apvs
  # POST /ins_apvs.json
  def create
    @ins_apv = InsApv.new(ins_apv_params)

    respond_to do |format|
      if @ins_apv.save
        format.html { redirect_to @ins_apv, notice: 'Ins apv was successfully created.' }
        format.json { render :show, status: :created, location: @ins_apv }
      else
        format.html { render :new }
        format.json { render json: @ins_apv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ins_apvs/1
  # PATCH/PUT /ins_apvs/1.json
  def update
    respond_to do |format|
      if @ins_apv.update(ins_apv_params)
        format.html { redirect_to @ins_apv, notice: 'Ins apv was successfully updated.' }
        format.json { render :show, status: :ok, location: @ins_apv }
      else
        format.html { render :edit }
        format.json { render json: @ins_apv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ins_apvs/1
  # DELETE /ins_apvs/1.json
  def destroy
    @ins_apv.destroy
    respond_to do |format|
      format.html { redirect_to ins_apvs_url, notice: 'Ins apv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ins_apv
      @ins_apv = InsApv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ins_apv_params
      params.require(:ins_apv).permit(:apv_cod, :ins_cod, :ins_cod_prov)
    end
end
