# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp.controller 'catCtrl', ($scope, $http, $window) ->
  $http.get('/api/buyer/find_home_cats').then((response) ->
    console.log(response.data)
    $scope.cats = response.data
  , (response) ->
    console.log(response.data)
    alert "fail: " + response.data
  );

mainApp.controller 'catItemsCtrl', ($scope, $http, $window) ->
  $scope.init = (cat_id) ->
    $scope.cat_id=cat_id
    url = '/api/buyer/find_sub_cats_by_cat/'+$scope.selectedSubcategory
    $http.get('/api/buyer/find_sub_cats_by_cat/'+cat_id).then((response) ->
      console.log(response.data)
      $scope.sub_cats = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );
    getItem()


  $scope.setSelectedSubcategory = (sub_id) ->
    $scope.selectedSubcategory = sub_id
    getItem()
  $scope.deselectSubcategory = ()->
    $scope.selectedSubcategory = null;
    getItem()

  getItem = ()->
    if ($scope.selectedSubcategory==undefined || $scope.selectedSubcategory==null)
      url = '/api/buyer/find_frequent_item/' +$scope.cat_id
    else
      url = '/api/buyer/find_item_by_sub_cat/' +$scope.selectedSubcategory
    $http.get(url).then((response) ->
      console.log(response.data)
      $scope.items = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );
