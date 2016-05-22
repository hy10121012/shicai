# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp.controller 'itemDetailCtrl', ($scope, $http, $window) ->
  $scope.init = (item_id) ->
    $http.get('/item/'+item_id).then((response) ->
      console.log(response.data)
      $scope.item = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );
