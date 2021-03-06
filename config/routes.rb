Rails.application.routes.draw do

  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  devise_for :users
  resources :vendedors
  resources :valors
  resources :transicion_estado_pedidos
  resources :transicion_estado_dcs
  resources :transicion_estado_arts
  resources :solicitud_devolucions
  resources :proveedors
  resources :propiedads
  resources :propiedad_valors
  resources :pedidos
  resources :nota_creditos
  resources :instancis
  resources :ins_apvs
  resources :imagens
  resources :historial_estado_pedidos
  resources :historial_estado_dcs
  resources :guia_despacho_pedidos
  resources :guia_despacho_compras
  resources :estado_pedidos
  resources :estado_dcs
  resources :estado_articulos
  resources :documento_de_compras
  resources :documento_de_cobros
  resources :direccions
  resources :detalle_sol_devolucions
  resources :detalle_pedidos
  resources :detalle_documento_de_compras
  resources :clientes
  resources :categoris
  resources :auditoris
  resources :articulos
  resources :art_props
  resources :art_prop_vals
  get 'preguntas_frecuentes/index'
  get "Preguntas" , to: 'preguntas_frecuentes#index'
   get "MiCuenta" , to: 'clientes#index'
  get 'politicas/despacho'
  get 'Despacho', to: 'politicas#despacho'

  get 'politicas/devolucion'
  get 'Devolucion', to: 'politicas#devolucion'
  
  get 'quien_somos/index'
  get 'Quienes_somos' , to: 'quien_somos#index'
  get "contacto/index"
  get "Contacto", to: 'contacto#index'
 
  get 'principal/index'
get 'pagar', to: 'documento_de_compras#pagar'
get 'CrearSolDev', to: 'solicitud_devolucions#crearsolicitud'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
root "principal#index"
resources :instancis do
    member do
      get 'copy'
    end
  end

  resources :pedidos do
    member do
      get 'editar'
    end
  end
post 'categoris/add'
post 'documento_de_compras/pagar_cuenta'
post 'solicitud_devolucions/paso2'
post 'solicitud_devolucions/agregarlinea'
post 'solicitud_devolucions/terminarcreacion'
post 'detalle_pedidos/creardetalle'
get 'agregardetalle', to: 'solicitud_devolucions#agregardetalle'
match '/404', to: 'errors#file_not_found', via: :all
match '/422', to: 'errors#unprocessable', via: :all
match '/500', to: 'errors#internal_server_error', via: :all
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
