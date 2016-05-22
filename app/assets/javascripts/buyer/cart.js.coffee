# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp = angular.module 'mainApp', [];

mainApp.controller 'cartCtrl', ($scope, $http, $window) ->
  $http.get('/api/buyer/cart/find_current_cart_list').then((response) ->
    console.log(response.data)
    $scope.cart_items = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );

  $http.get('/api/buyer/account_management/find_user_default_address').then((response) ->
    console.log(response.data)
    $scope.default_address = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );

