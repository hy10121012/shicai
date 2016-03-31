# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


mainApp = angular.module 'mainApp', [];

mainApp.controller 'ordersCtrl', ($scope, $http,$window) ->
  select_ = (path) ->
    $http.get('/api/seller/order_management/'+path).then((response) ->
      $scope.orders = response.data
    , (response) ->
      alert "fail: " + response.data
    );

  $scope.select_type = (type) ->
    if type=='tmr'
      select_('find_tmr_orders/20160326')
    else
      select_('find_orders_by_type/'+type)

  $scope.view_details = (id) ->
    $window.location.href= '/order_details/'+id

  $scope.select_type 'tmr'




mainApp.controller 'orderDetailsCtrl', ($scope, $http, $window) ->
  $scope.id;
  $scope.init = (id) ->
    $scope.id=id
    $http.get('/api/seller/order_management/find_order_details/'+id).then((response) ->
      console.log(response.data)
      $scope.order = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );

    $http.get('/api/seller/order_management/find_order_items/'+id).then((response) ->
      console.log(response.data)
      $scope.items = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    )


