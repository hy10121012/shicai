# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp = angular.module 'mainApp', [];

mainApp.controller 'inventoryCtrl', ($scope, $http, $window) ->
  $http.get('/api/seller/find_home_cats').then((response) ->
    console.log(response.data)
    $scope.cats = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );

  $http.get('/api/seller/find_selling_item').then((response) ->
    console.log(response.data)
    $scope.item_cats = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );


