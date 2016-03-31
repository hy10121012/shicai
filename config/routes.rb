Rails.application.routes.draw do

  namespace :seller do
  end

  namespace :seller do
  get 'customer_management/customers'
  get 'finance_management/finance_summary'
  get 'customer_management/customer_details'
  get 'order/orderDetail'
  get 'price/update_price'
  get 'order/orders'

  end



  class IsSeller
    def self.matches?(request)
      request.session[:user_type]==2
    end
  end

  class IsBuyer
    def self.matches?(request)
      request.session[:user_type]==1
    end
  end


  get 'login/login'
  root 'login#login'

  get  '/inventories' => 'seller/inventory#inventory', constraints: IsSeller
  get  '/home' => 'seller/inventory#inventory', constraints: IsSeller
  get  '/pricing/:sub_cat_id' => 'seller/price#update_price' , constraints: IsSeller
  get  '/orders' => 'seller/order_management#orders' , constraints: IsSeller
  get  '/order_details/:order_id' => 'seller/order_management#order_details' , constraints: IsSeller
  get  '/customers' => 'seller/customer_management#customers' , constraints: IsSeller
  get  '/customer_details/:user_id' => 'seller/customer_management#customer_details' , constraints: IsSeller
  get '/fin_states' => 'seller/finance_management#finance_summary'
  get '/conversation/:conv_id' => 'messages#find_conversation'


  scope 'api' do
    post 'login' => 'api/login#do_login_action'
    get 'login' => 'api/login#login_action'
    put 'create_user'=>'api/login#do_create_user'
    get 'messages/find_messages'=>'api/messages#find_messages'
    get '/conversation/:conv_id' => 'api/messages#find_conversation_text'
    put '/send_message'=>'api/messages#send_message'

  end


  namespace :api do
    namespace :buyer do
      get 'account_management/find_orders_by_status'
      get 'account_management/find_order_count_summary'
      get 'account_management/find_user_addresses'
      get 'management/find_favor_sellers'
      get 'management/find_favor_items'
      get 'management/find_frequent_item'
      get 'management/remove_favor_seller'
      get 'management/remove_favor_item'
      get 'cart/find_current_cart_list'
      get 'find_home_cats' => 'home#find_home_category_items'
    end
  end


  namespace :api do
    namespace :seller do
      get 'find_home_cats'=>'inventory#find_selling_cats'
      get 'finance_management/find_finance_summary'
      get 'customer_management/find_customers'
      get 'customer_management/find_customer_details/:user_id' => 'customer_management#find_customer_details'
      get 'order_management/find_all_orders'
      get 'order_management/find_orders_by_type/:status' => 'order_management#find_orders_by_type'
      get 'order_management/find_order_details/:order_id'   => 'order_management#order_details'
      get 'order_management/trigger_favor'
      get 'order_management/find_order_items/:order_id'   => 'order_management#find_order_items'
      get 'order_management/find_tmr_orders' => 'order_management#find_tmr_orders'
      get 'order_management/find_tmr_orders/:date' => 'order_management#find_tmr_orders'
      get 'item/find_single_item'
      post 'price/do_single_pricing'
      get 'price/do_batch_pricing'
      get 'price/find_cat_item_prices/:sub_cat_id' => 'price#find_cat_item_prices'
      get 'find_selling_item/' => 'inventory#find_selling_items'
      get 'find_item/:item_id' => 'item#find_single_item'
      get 'find_item/:item_id' => 'item#find_single_item'
      post 'update_item/:item_id' => 'item#update_single_field'
    end
  end

  namespace :buyer do

  end

  resources :messages



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
