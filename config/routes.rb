Rails.application.routes.draw do
  get 'users/signup'
  post 'users/signup_done'

  get 'users/login'
  post 'users/login_done'

  get 'users/logout'

  get 'posts/show_all'

  get 'posts/show/:id' => 'posts#show'

  get 'posts/write'
  post 'posts/write_done'

  get 'posts/edit/:id' => 'posts#edit'
  post 'posts/edit_done'

  get 'posts/delete_done/:id' => 'posts#delete_done'

  post 'posts/write_comment_done'

  get 'posts/edit_comment/:id' => 'posts#edit_comment'
  post 'posts/edit_comment_done'

  get 'posts/delete_comment_done/:id' => 'posts#delete_comment_done'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'posts#show_all'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get '/:category' => 'posts#show_by_category'
  get '/posts/:category' => 'posts#show_by_category'

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
