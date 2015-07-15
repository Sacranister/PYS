class VendedorsController < ApplicationController
  before_action :set_vendedor, only: [:show, :edit, :update, :destroy]

  # GET /vendedors
  # GET /vendedors.json
  def index
    @vendedors = Vendedor.all
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

  # GET /vendedors/1
  # GET /vendedors/1.json
  def show
  end

  # GET /vendedors/new
  def new
    @vendedor = Vendedor.new
  end

  # GET /vendedors/1/edit
  def edit
  end

  # POST /vendedors
  # POST /vendedors.json
  def create
    @vendedor = Vendedor.new(vendedor_params)
    @user=User.where(email:@vendedor.ven_mail).take
    if @user.blank?
        respond_to do |format|
          if @vendedor.save
            User.create(email:@vendedor.ven_mail,password:'pysdesign',password_confirmation:'pysdesign',cli_nom:@vendedor.ven_nom,role: 'vendedor')
            @user=User.where(email:@vendedor.ven_mail).take
            @user.update(role: 'vendedor')
            format.html { redirect_to @vendedor, notice: 'Vendedor was successfully created.' }
            format.json { render :show, status: :created, location: @vendedor }
          else
            format.html { render :new }
            format.json { render json: @vendedor.errors, status: :unprocessable_entity }
          end
        end
    else
        respond_to do |format|
          format.html { redirect_to new_vendedor_path, notice: 'El correo ya se encuentra en nuestra base de datos'}
        end
    end
  end

  # PATCH/PUT /vendedors/1
  # PATCH/PUT /vendedors/1.json
  def update
    respond_to do |format|
      if @vendedor.update(vendedor_params)
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendedor }
      else
        format.html { render :edit }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendedors/1
  # DELETE /vendedors/1.json
  def destroy
    @user=User.where(email:@vendedor.ven_mail).take
    @user.destroy
    @vendedor.destroy
    respond_to do |format|
      format.html { redirect_to vendedors_url, notice: 'Vendedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendedor_params
      params.require(:vendedor).permit(:ven_nom, :ven_rut, :ven_mail, :ven_tel)
    end
end
