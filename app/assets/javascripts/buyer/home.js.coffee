# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


mainApp.controller 'homeCtrl', ($scope, $http, $window) ->
  $http.get('/api/buyer/find_home_cats').then((response) ->
    console.log(response.data)
    $scope.cats = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );
  $http.get('/api/buyer/find_ads_items').then((response) ->
    console.log(response.data)
    $scope.items = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );


