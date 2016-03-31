# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
mainApp = angular.module 'mainApp', [];

mainApp.controller 'finStatesCtrl', ($scope, $http, $window) ->
  $http.get('/api/seller/finance_management/find_finance_summary').then((response) ->
    console.log(response.data)
    $scope.overall = response.data.overall
    $scope.monthly = response.data.monthly
    $scope.clients = response.data.clients
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );

