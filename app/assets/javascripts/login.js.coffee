# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp.controller 'loginCtrl', ($scope,$http,$window) ->

  loginSuccess = (response) ->
    alert "success "+response.data.status
    if  response.data.status =='success'
      $window.location.href = '/home';

  loginFail = (response) ->
    alert "login fail"+response.data.status


  $scope.login = (data) ->
    add_csrf data
    $http.post('api/login', data).then(loginSuccess, loginFail);



