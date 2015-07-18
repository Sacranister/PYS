class ArtPropValsController < ApplicationController
  before_action :set_art_prop_val, only: [:show, :edit, :update, :destroy]

  # GET /art_prop_vals
  # GET /art_prop_vals.json
  def index
respond_to do |format|
        format.html { redirect_to :root }
    end 
  end

  # GET /art_prop_vals/1
  # GET /art_prop_vals/1.json
  def show
       respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /art_prop_vals/new
  def new
    @art_prop_val = ArtPropVal.new
    respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # GET /art_prop_vals/1/edit
  def edit
       respond_to do |format|
        format.html { redirect_to :root }
      end
  end
  def copy
   respond_to do |format|
        format.html { redirect_to :root }
      end
  end

  # POST /art_prop_vals
  # POST /art_prop_vals.json
  def create
    @art_prop_val = ArtPropVal.new(art_prop_val_params)

    respond_to do |format|
      if @art_prop_val.save
        format.html { redirect_to @art_prop_val, notice: 'Art prop val was successfully created.' }
        format.json { render :show, status: :created, location: @art_prop_val }
      else
        format.html { render :new }
        format.json { render json: @art_prop_val.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_prop_vals/1
  # PATCH/PUT /art_prop_vals/1.json
  def update
    respond_to do |format|
      if @art_prop_val.update(art_prop_val_params)
        format.html { redirect_to @art_prop_val, notice: 'Art prop val was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_prop_val }
      else
        format.html { render :edit }
        format.json { render json: @art_prop_val.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_prop_vals/1
  # DELETE /art_prop_vals/1.json
  def destroy
    @art_prop_val.destroy
    respond_to do |format|
      format.html { redirect_to art_prop_vals_url, notice: 'Art prop val was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_prop_val
      @art_prop_val = ArtPropVal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_prop_val_params
      params.require(:art_prop_val).permit(:val_cod, :art_cod, :prop_cod)
    end
end
