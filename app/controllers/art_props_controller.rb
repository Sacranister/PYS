class ArtPropsController < ApplicationController
  before_action :set_art_prop, only: [:show, :edit, :update, :destroy]

  # GET /art_props
  # GET /art_props.json
  def index
    @art_props = ArtProp.all
  end

  # GET /art_props/1
  # GET /art_props/1.json
  def show
  end

  # GET /art_props/new
  def new
    @art_prop = ArtProp.new
  end

  # GET /art_props/1/edit
  def edit
  end

  # POST /art_props
  # POST /art_props.json
  def create
    @art_prop = ArtProp.new(art_prop_params)

    respond_to do |format|
      if @art_prop.save
        format.html { redirect_to @art_prop, notice: 'Art prop was successfully created.' }
        format.json { render :show, status: :created, location: @art_prop }
      else
        format.html { render :new }
        format.json { render json: @art_prop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_props/1
  # PATCH/PUT /art_props/1.json
  def update
    respond_to do |format|
      if @art_prop.update(art_prop_params)
        format.html { redirect_to @art_prop, notice: 'Art prop was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_prop }
      else
        format.html { render :edit }
        format.json { render json: @art_prop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_props/1
  # DELETE /art_props/1.json
  def destroy
    @art_prop.destroy
    respond_to do |format|
      format.html { redirect_to art_props_url, notice: 'Art prop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art_prop
      @art_prop = ArtProp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_prop_params
      params.require(:art_prop).permit(:prop_cod, :art_cod)
    end
end
