Rails.application.routes.draw do

   # Site root
	root 'site/site#index'

  # Admin root
  get 'admin' => 'admin#index'  

  # Login actions
  get 'login'   => 'sessions#new'
  post 'access'  => 'sessions#create'
  get 'logout'  => 'sessions#destroy'

  # Admin area context
  namespace :admin do
    with_options(except: [:show]) do
      resources :categories, :entries, :tags, :suggestions
    end
  end

  # front office routes (keep slug being the last one to avoid conflict with other routes)
  get 'busca/:keyword(.:format)' => 'site/site#search'
  get 'letra/:letter(.:format)' => 'site/site#letter'
  get ':slug(.:format)' => 'site/site#detail'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
