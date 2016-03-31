# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


mainApp = angular.module 'mainApp', [];

mainApp.controller 'pricingCtrl', ($scope, $http, $window, $element) ->
  $scope.init = (sub_cat_id) ->
    $http.get('/api/seller/price/find_cat_item_prices/' + sub_cat_id).then((response) ->
      console.log(response.data)
      $scope.items = response.data
    , (response) ->
      console.log(response.data)
    );

    $scope.update_price = (ele) ->
      o_price = ele.currentTarget.attributes['o-price'].value
      if(o_price != ele.currentTarget.value)
        data = {
          'item_id': ele.currentTarget.attributes['item-id'].value,
          'price': ele.currentTarget.value
        }
        add_csrf data

        $http.post('/api/seller/price/do_single_pricing', data).then((response) ->
          ele.currentTarget.attributes['o-price'].value = ele.currentTarget.value
          console.log(response.data)
        , (response) ->
          console.log(response.data)
        );



