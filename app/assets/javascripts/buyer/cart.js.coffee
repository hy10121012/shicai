# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp.controller 'cartCtrl', ($scope, $http, $window) ->
  $scope.total=0
  $scope.deliveryTime= 10

  $scope.init = (id) ->
    if id!=0
      url = '/api/buyer/address_details/' + id
    else
      url = '/api/buyer/find_user_default_address'

    $http.get(url).then((response) ->
      console.log(response.data)
      $scope.address = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );

  $http.get('/api/buyer/cart/find_current_cart_list').then((response) ->
    console.log(response.data)
    $scope.cart_items = response.data.items
    $scope.user = response.data.user
    recalc()
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );

  $scope.delete = (cart_item) ->
    con = confirm("确定删除本物品吗？")
    data = {}
    add_csrf(data)
    console.log data
    if con == true
      $http.delete('api/buyer/delete_from_cart/'+cart_item.id+"?authenticity_token="+encodeURIComponent(AUTH_TOKEN),data).then((response) ->
        if response.data == 'true'
          $scope.cart_items.splice(cart_item, 1);
      ,(response) ->
        console.log(response.data)
        alert "fail: " + response.data
      );

  $scope.sendOrder = () ->
    date = $('#datetimepicker1').val()
    time = $('#time').val()
    if(date == "")
      alert "送货日期不能为空"
    if(time == "")
      alert "送货时间不能为空"
    data = {items:$scope.cart_items,address_id: $scope.address.id,date:date,time:$scope.deliveryTime}
    add_csrf data
    $http.put('api/buyer/create_order/',data).then((response) ->
      alert "已经提交订单，请立即付款";
      window.location = '/payment/'+response.data
    ,(response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );

  $scope.increment = (item,amount) ->
    total = item.quantity
    total =  total*1
    amount =  amount*1
    if (total + amount)>0
      item.quantity = total + amount;
      recalc();

  recalc = () ->
    angular.forEach($scope.cart_items,(item) ->
      $scope.total += item.quantity*item.item.price
    )

$('#datetimepicker1').datetimepicker();

