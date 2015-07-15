class SolicitudDevolucionsController < ApplicationController
  before_action :set_solicitud_devolucion, only: [:show, :edit, :update, :destroy]

  # GET /solicitud_devolucions
  # GET /solicitud_devolucions.json
  def index
    @solicitud_devolucions = SolicitudDevolucion.all
  end

  # GET /solicitud_devolucions/1
  # GET /solicitud_devolucions/1.json
  def show
    if current_user    
      @clientess=Cliente.where(cli_mail: current_user.email).take
      if ((current_user && current_user.role=='admin') || (current_user && (@clientess.cli_cod == @solicitud_devolucion.cli_cod)))
      else
          respond_to do |format|
            format.html { redirect_to :root, notice: 'No estas autorizado para ver esta pagina' }
          end
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, notice: 'No estas autorizado para ver esta pagina.' }
      end
    end 

  end

  # GET /solicitud_devolucions/new
  def new
    @solicitud_devolucion = SolicitudDevolucion.new
  end

  # GET /solicitud_devolucions/1/edit
  def edit
  end


def crearsolicitud
  if(current_user && current_user.role=='cliente')
    @cliente2=Cliente.where(cli_mail: current_user.email).take
    @dev=SolicitudDevolucion.where(cli_cod: @cliente2.cli_cod,sol_dev_est: nil).take
    if @dev.blank?
      @soldev=SolicitudDevolucion.new
      @soldev.cli_cod=@cliente2.cli_cod
    else
      flash[:notice]='Si ves este mensaje, es por que tienes una solicitud en creacion,descartala para crear una nueva'
    end 
  else
    respond_to do |format| 
      format.html { redirect_to :root, notice: 'No estas autorizado para ver esta pagina.' }
    end
  end 
end

def paso2
    @cliente2=Cliente.where(cli_mail: current_user.email).take
    @soldev=SolicitudDevolucion.new
    @soldev.cli_cod=@cliente2.cli_cod
    @val = params[:val]
    @soldev.doc_com_cod=@val
    if @soldev.save
        respond_to do |format| 
        format.html {redirect_to action: "agregardetalle"}
        #format.html { render :controller=> 'solicitud_devolucions',:action => "agregardetalle" }
      end
    end
end

def agregardetalle
  @cliente3=Cliente.where(cli_mail: current_user.email).take
  @soldev1=SolicitudDevolucion.where(cli_cod: @cliente3.cli_cod,sol_dev_est: nil).take
  @det=DetalleDocumentoDeCompra.where(doc_com_cod: @soldev1.doc_com_cod)
  @detsol=DetalleSolDevolucion.where(sol_dev_cod: @soldev1.sol_dev_cod)

end

def agregarlinea
  @val = params[:val]
  @cliente3=Cliente.where(cli_mail: current_user.email).take
  @soldev1=SolicitudDevolucion.where(cli_cod: @cliente3.cli_cod,sol_dev_est: nil).take
  @det=DetalleDocumentoDeCompra.where(doc_com_cod: @soldev1.doc_com_cod)
  @precio=@det.where(ins_cod: @val).take
  @detsol=DetalleSolDevolucion.where(sol_dev_cod: @soldev1.sol_dev_cod)
  @instancia=Instanci.where(ins_cod: @val).take
  if @detsol.blank?
    flash[:notice]='Agregado'
    @detsol=DetalleSolDevolucion.new(sol_dev_cod:@soldev1.sol_dev_cod,det_sol_dev_linea:1,ins_cod:@val,ins_cod_prov: @instancia.ins_cod_prov,det_sol_dev_cant:1,det_sol_dev_precio:@precio.det_doc_com_precio_uni )
    @detsol.save
  else
    #si existe
    @valors=@detsol.where(ins_cod: @val).take
    if @valors.blank?
      @detlin=@detsol.order(det_sol_dev_linea: :desc).take
      @detsol=DetalleSolDevolucion.new(sol_dev_cod:@soldev1.sol_dev_cod,det_sol_dev_linea:(@detlin.det_sol_dev_linea + 1),ins_cod:@val,ins_cod_prov: @instancia.ins_cod_prov,det_sol_dev_cant:1,det_sol_dev_precio:@precio.det_doc_com_precio_uni )
      @detsol.save
    else
      @detlin=@detsol.order(det_sol_dev_linea: :desc).take
      @valors.update(det_sol_dev_cant:@valors.det_sol_dev_cant+1,det_sol_dev_precio:@valors.det_sol_dev_precio+@precio.det_doc_com_precio_uni )
    end

  end
    respond_to do |format| 
      format.html {redirect_to action: "agregardetalle"}
        #format.html { render :controller=> 'solicitud_devolucions',:action => "agregardetalle" }
      end
end
def terminarcreacion
    @cliente3=Cliente.where(cli_mail: current_user.email).take
    @soldev1=SolicitudDevolucion.where(cli_cod: @cliente3.cli_cod,sol_dev_est: nil).take
    @soldev1
    respond_to do |format|
      if @soldev1.update(solicitud_devolucion_params)
        @soldev1.sol_dev_est='Pendiente'
        @soldev1.save
        format.html { redirect_to @soldev1 , notice: '' }
      end
    end 
end
  # POST /solicitud_devolucions
  # POST /solicitud_devolucions.json
  def create
    @solicitud_devolucion = SolicitudDevolucion.new(solicitud_devolucion_params)

    respond_to do |format|
      if @solicitud_devolucion.save
        format.html { redirect_to @solicitud_devolucion, notice: 'Solicitud devolucion was successfully created.' }
        format.json { render :show, status: :created, location: @solicitud_devolucion }
      else
        format.html { render :new }
        format.json { render json: @solicitud_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitud_devolucions/1
  # PATCH/PUT /solicitud_devolucions/1.json
  def update
    respond_to do |format|
      if @solicitud_devolucion.update(solicitud_devolucion_params)
        format.html { redirect_to @solicitud_devolucion, notice: 'Solicitud devolucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitud_devolucion }
      else
        format.html { render :edit }
        format.json { render json: @solicitud_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitud_devolucions/1
  # DELETE /solicitud_devolucions/1.json
  def destroy
    @solicitud_devolucion.destroy
    respond_to do |format|
      format.html { redirect_to solicitud_devolucions_url, notice: 'Solicitud devolucion eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud_devolucion
      @solicitud_devolucion = SolicitudDevolucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_devolucion_params
      params.require(:solicitud_devolucion).permit(:not_cre_cod, :doc_com_cod, :ven_cod, :cli_cod, :sol_dev_comentario, :sol_dev_est, :sol_dev_fecha)
    end
end
