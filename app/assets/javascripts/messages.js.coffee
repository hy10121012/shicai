# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


mainApp = angular.module 'mainApp', [];

mainApp.controller 'msgCtrl', ($scope,$http) ->
  $http.get('/api/messages/find_messages').then((response) ->
    console.log(response.data)
    $scope.conversations = response.data
  , (response) ->
    console.log(response.data)
  );


mainApp.controller 'convCtrl', ($scope,$http) ->
  $scope.init = (conv_id) ->
    $scope.id = conv_id
    $http.get('/api/conversation/'+conv_id).then((response) ->
      $scope.conversations = response.data
    , (response) ->
    );

  $scope.sendMsg = () ->
    alert $scope.receiver_id
    data = {'content':$scope.content,'user_id':$scope.receiver_id}
    add_csrf data
    alert data
    $http.put('/api/send_message', data).then((response) ->
      if(response.data == "true")
        $scope.conversations.unshift(data)
    , (response) ->
      alert response.data
    );




