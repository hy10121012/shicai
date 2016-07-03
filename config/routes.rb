Rails.application.routes.draw do



  namespace :api do
  namespace :buyer do
    get 'register/register'
    end
  end

  namespace :api do
  namespace :buyer do
    get 'register/submit_details'
    end
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
  get 'register'=>'login#register'

  get '/inventories' => 'seller/inventory#inventory', constraints: IsSeller
  get '/home' => 'seller/inventory#inventory', constraints: IsSeller
  get '/home' => 'buyer/home#index', constraints: IsBuyer
  get '/pricing/:sub_cat_id' => 'seller/price#update_price', constraints: IsSeller
  get '/orders' => 'seller/order_management#orders', constraints: IsSeller
  get '/order_details/:order_id' => 'seller/order_management#order_details', constraints: IsSeller
  get '/customers' => 'seller/customer_management#customers', constraints: IsSeller
  get '/customer_details/:user_id' => 'seller/customer_management#customer_details', constraints: IsSeller
  get '/fin_states' => 'seller/finance_management#finance_summary'
  get '/conversation/:conv_id' => 'messages#find_conversation'
  get '/home' => 'buyer/home#index', constraints: IsBuyer
  get '/cart' => 'buyer/cart#index', constraints: IsBuyer
  post '/cart' => 'buyer/cart#index', constraints: IsBuyer
  get '/categories' => 'buyer/categories#index', constraints: IsBuyer
  get '/category/:cat_id' => 'buyer/categories#show_by_cat', constraints: IsBuyer
  get '/item/:item_id' => 'buyer/item#item_detail', constraints: IsBuyer
  get '/addresses' => 'buyer/address#address_list', constraints: IsBuyer
  get 'address_new' => 'buyer/address#address_new', constraints: IsBuyer
  get '/change_addr' => 'buyer/address#change_addr', constraints: IsBuyer
  get '/address/:id' => 'buyer/address#address_detail', constraints: IsBuyer
  get '/account' => 'buyer/account#index', constraints: IsBuyer
  get '/account/basic_info' => 'buyer/account#basic_info', constraints: IsBuyer
  get '/account/pw' => 'buyer/account#pw', constraints: IsBuyer
  get '/account/payment' => 'buyer/account#payment', constraints: IsBuyer
  get '/search/:search' => 'buyer/home#search', constraints: IsBuyer
  get '/account/orders/:status' => 'buyer/account#find_orders_by_status', constraints:IsBuyer
  get '/tmr_order' => 'buyer/account#find_tmr_order', constraints:IsBuyer
  get '/history_order' => 'buyer/account#find_orders_by_status', constraints:IsBuyer
  get '/order_details/:order_id' => 'buyer/account#find_order_details' , constraints:IsBuyer
  get '/payment/:order_id' => 'buyer/payment#payment', constraints:IsBuyer
  get '/payment_callback/:order_id' => 'buyer/payment#payment_callback' , constraints:IsBuyer
  get '/feedback/:order_id' => 'buyer/account#feedback', constraints:IsBuyer
  get '/submit_details' => 'buyer/account#feedback'
  get '/registered_direct/:id/:hash' => 'api/buyer/register#registered_redirect_to'



  scope 'api' do
    post 'login' => 'api/login#do_login_action'
    get 'login' => 'api/login#login_action'
    put 'create_user' => 'api/login#do_create_user'
    get 'messages/find_messages' => 'api/messages#find_messages'
    get '/conversation/:conv_id' => 'api/messages#find_conversation_text'
    put '/send_message' => 'api/messages#send_message'
    put '/create_order' => 'api/buyer/cart#create_order'
  end


  namespace :api do
    namespace :buyer do
      get 'orders/:status' => 'order#find_orders_by_status';
      get 'account_management/find_order_count_summary'
      get 'address_list' => 'address#find_user_addresses';
      get 'address_details/:id' => 'address#find_address_detail';
      get 'find_user_default_address' => 'address#find_user_default_address';
      get 'management/find_favor_sellers'
      get 'management/find_favor_items'
      get 'management/find_frequent_item'
      get 'management/remove_favor_seller'
      get 'management/remove_favor_item'
      get 'cart/find_current_cart_list' => 'cart#find_current_cart_list'
      get 'find_home_cats' => 'home#find_home_category_items'
      get 'find_ads_items' => 'home#find_ads_items'
      get 'find_sub_cats_by_cat/:cat_id' => 'item_list#find_sub_cats_by_cat';
      get 'find_frequent_item/:cat_id' => 'item_list#find_frequent_item';
      get 'find_item_by_sub_cat/:sub_cat_id' => 'item_list#find_item_by_sub_cat';
      get 'item/:item_id' => 'item_list#find_item_detail';
      get 'find_province' => 'address#find_province';
      get 'find_city/:province_id' => 'address#find_city_by_province_id';
      get 'find_district/:city_id' => 'address#find_district_by_city_id';
      get 'find_street/:district_id' => 'address#find_street_by_district_id';
      get 'find_order_status' => 'order#find_order_counts';
      get '/tmr_order' => 'order#find_tmr_order'
      get '/history_order' => 'order#history_order'
      get '/find_order_details/:order_id' => 'order#find_order_details'
      get '/find_order_items/:order_id' => 'order#find_order_items'
      get '/is_registered/:number' => 'register#is_registered'
      post 'set_default_address' =>   'address#set_default';
      post 'add_to_cart' => 'item_list#add_to_cart';
      post 'update_address' => 'address#update_address';
      delete 'delete_from_cart/:id' => 'cart#delete_item'
      post 'cancel_order' => 'order#cancel_order';
      post 'confirm_order' => 'order#confirm_order';
      put 'create_order' => 'cart#create_order';
      put '/sendComment' => 'order#add_comment'
      put '/register' => 'register#register'



    end
  end


  namespace :api do
    namespace :seller do
      get 'find_home_cats' => 'inventory#find_selling_cats'
      get 'finance_management/find_finance_summary'
      get 'customer_management/find_customers'
      get 'customer_management/find_customer_details/:user_id' => 'customer_management#find_customer_details'
      get 'order_management/find_all_orders'
      get 'order_management/find_orders_by_type/:status' => 'order_management#find_orders_by_type'
      get 'order_management/find_order_details/:order_id' => 'order_management#order_details'
      get 'order_management/trigger_favor'
      get 'order_management/find_order_items/:order_id' => 'order_management#find_order_items'
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
