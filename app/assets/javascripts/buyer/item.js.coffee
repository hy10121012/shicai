# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp.controller 'itemDetailCtrl', ($scope, $http, $window) ->
  $scope.init = (item_id) ->
    $http.get('/api/buyer/item/'+item_id).then((response) ->
      console.log(response.data)
      $scope.item = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );
  $scope.quantity=1
  $scope.increment = (amount) ->

    $scope.quantity =   $scope.quantity*1
    amount =  amount*1
    if ( $scope.quantity + amount)>0
      $scope.quantity = $scope.quantity + amount;

  $scope.addToCart = () ->
    data = {'item_id':$scope.item.id,'quantity':$scope.quantity}
    add_csrf  data
    $http.post("/api/buyer/add_to_cart",data).then((response) ->
      console.log(response.data)
      if response.data == 'true'
        alert "成功添加"
        $scope.quantity=1
      else
        alert '添加失败'

    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    )
