Rails.application.routes.draw do

  devise_for :users
  resources :articles
  #resources :users
  resources :teams
  resources :complete_bets
  resources :matches do
    collection {post :import}
  end
  resources :match_results

  get '/users/edit_profile',  to: 'users#edit_profile'
  get '/users/edit_password', to: 'users#edit_password'
  get '/users/bet_history', to: 'users#bet_history'
  get '/allbets', to: 'welcome#all_bets'
  get '/service', to: 'matches#service'

  post '/service/events', to: 'service#call_events_service'
  post '/service/match_results', to: 'service#match_results'
  post '/matches/:id/accept', to: 'matches#accept'

  resources :users

  root 'welcome#index'

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
