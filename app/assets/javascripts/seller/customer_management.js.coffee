# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp = angular.module 'mainApp', [];

mainApp.controller 'customersCtrl', ($scope, $http, $window) ->
  $http.get('/api/seller/finance_management/find_finance_summary').then((response) ->
    console.log(response.data)
    $scope.customers = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );


mainApp.controller 'customerDetailsCtrl', ($scope, $http, $window) ->
  $scope.init = (id) ->
    $http.get('/api/seller/customer_management/find_customer_details/'+id).then((response) ->
      console.log(response.data)
      $scope.customer = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );


