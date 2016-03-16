Rails.application.routes.draw do
  namespace :api do
  namespace :seller do
    get 'fiance_management/find_finance_summary'
    end
  end

  namespace :api do
  namespace :seller do
    get 'customer_management/find_customer'
    end
  end

  namespace :api do
  namespace :seller do
    get 'customer_management/find_customer_detail'
    end
  end

  namespace :api do
  namespace :seller do
    get 'order_management/find_all_orders'
    end
  end

  namespace :api do
  namespace :seller do
    get 'order_management/find_orders_by_type'
    end
  end

  namespace :api do
  namespace :seller do
    get 'order_management/order_detail'
    end
  end

  namespace :api do
  namespace :seller do
    get 'order_management/trigger_favor'
    end
  end

  namespace :api do
  namespace :seller do
    get 'order_management/find_order_items'
    end
  end

  namespace :api do
  namespace :seller do
    get 'item/find_single_item'
    end
  end

  namespace :api do
  namespace :seller do
    get 'price/do_single_pricing'
    end
  end

  namespace :api do
  namespace :seller do
    get 'price/do_batch__pricing'
    end
  end

  namespace :api do
  namespace :seller do
    get 'price/get_cat_item_price'
    end
  end

  namespace :buyer do
  get 'home_page/index'
  end

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

  scope 'api' do
    post 'login' => 'api/login#do_login_action'
    get 'login' => 'api/login#login_action'

    get 'seller/find_selling_item/:user_id' =>  'api/seller/home#find_selling_items'
    get 'seller/find_item/:item_id' =>  'api/seller/item#find_single_item'
    get 'seller/find_item/:item_id' =>  'api/seller/item#find_single_item'
    post 'seller/update_item/:item_id' => 'api/seller/item#update_single_field'



  end

end
