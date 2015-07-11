Rails.application.routes.draw do

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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
root "principal#index"

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
