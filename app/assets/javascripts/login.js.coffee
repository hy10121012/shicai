# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mainApp.controller 'loginCtrl', ($scope, $http, $window) ->
  loginSuccess = (response) ->
    alert "success " + response.data.status
    if  response.data.status == 'success'
      $window.location.href = '/home';

  loginFail = (response) ->
    alert "login fail" + response.data.status


  $scope.login = (data) ->
    add_csrf data
    $http.post('api/login', data).then(loginSuccess, loginFail);



mainApp.controller 'registerCtrl', ($scope, $http, $window, $timeout) ->
  $scope.topPart = true;
  $scope.bottomPart = false;
  $scope.sentCode = false
  $scope.countdown = 0
  $scope.code_valid = false
  $scope.pass_valid = false
  $scope.number_valid = false
  $scope.name = null
  $scope.address={}
  $scope.address.res_name = null
  $scope.address.adress1 = null

  $scope.init = () ->
    $scope.loadProvince()


  $scope.next = ()->
    if  !$scope.pass_valid || !$scope.number_valid
      alert "信息错误，请检查所填信息"
      return false
    else
      $scope.topPart = false;
      $scope.bottomPart = true;



  $scope.register = ()->
    if  $scope.address.address1==null || $scope.address.res_name==null || $scope.address.province_id==null || $scope.address.city_id==null || $scope.address.district_id==null  || $scope.address.street_id==null || !$scope.pass_valid || !$scope.number_valid
      alert "信息不完整，请检查所填信息"
      return false
    else
      data = {phone: $scope.number,name: $scope.name,pw:$scope.password, address:$scope.address}
      add_csrf data
      $http.put('api/buyer/register', data).then((response) ->
        console.log  response.data
        if response.data == 'false'
          alert "注册失败，请检查所填信息"
        else
          alert "注册成功！我们将尽快核实您的信息，请耐心等候"
          window.location = '/registered_direct/'+response.data.id+'/'+response.data.hash

      , () ->
      );


  $scope.sendCode = ()->
    $scope.sentCode = true;
    $scope.countdown = 60
    $scope.doCountdown()

  $scope.validate_number = ()->
    $http.get('api/buyer/is_registered/' + $scope.number,).then((response) ->
      console.log response
      if(response.data == 'true')
        $('#number').css("color", "red")
        $scope.number_valid = false
      else
        $('#number').css("color", "black")
        $scope.number_valid = true
    , (response) ->
      alert "无法验证号码，请联系管理员"
    );


  $scope.validate_code = () ->
    if($scope.password && ($scope.password.length < 6 || $scope.password.length > 10) )
      $('#password_label').css("color", "red")
      $scope.pass_valid = false
    else
      $('#password_label').css("color", "#b9b9b9")
      $scope.pass_valid = true


    return false;

  $scope.doCountdown = ()->
    console.log($scope.countdown)
    if($scope.countdown * 1 > 0)
      $timeout (()->
        $scope.countdown--
        $scope.doCountdown()
      ), 1000
    else
      $scope.sentCode = false;
      alert $scope.sentCode

  $scope.loadProvince = () ->
    $http.get('/api/buyer/find_province').then((response) ->
      console.log(response.data)
      $scope.provinces = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );

  $scope.loadCity = () ->
    $scope.districts=null
    $scope.address.city_id=null
    $scope.address.district_id=null
    $http.get('/api/buyer/find_city/'+$scope.address.province_id).then((response) ->
      console.log(response.data)
      $scope.cities = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );

  $scope.loadDistrict = () ->
    $scope.streets=null
    $scope.address.district_id=null
    $scope.address.street_id=null
    $http.get('/api/buyer/find_district/'+$scope.address.city_id).then((response) ->
      console.log(response.data)
      $scope.districts = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );

  $scope.loadStreet = () ->
    $http.get('/api/buyer/find_street/'+$scope.address.district_id).then((response) ->
      console.log(response.data)
      $scope.streets = response.data
    , (response) ->
      console.log(response.data)
      alert "fail: " + response.data
    );

