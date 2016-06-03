@mainApp = angular.module('mainApp', []).directive('backgroundImage', () ->
  return (scope, element, attrs) ->
    url = attrs.backgroundImage
    element.css({'background-image': 'url("' + url + '")'})
)

mainApp.controller 'topNavCtrl', ($scope) ->
  $scope.back = () ->
    location.href = document.referrer;

  $scope.search = () ->
    window.location = '/search/'+ $scope.keyword;



mainApp.controller 'sellerNavCtrl', ($scope) ->
  $scope.items = [{
    image: '/img/seller/icon-inventory.png',
    title: '商品管理',
    href: '#/seller/inventory'
  }, {
    image: '/img/seller/icon-orders.png',
    title: '货单管理',
    href: '#/seller/orders'
  },
    {
      image: '/img/seller/icon-clients.png',
      title: '客户管理',
      href: '#/seller/clients'
    },
    {
      image: '/img/seller/icon-finance.png',
      title: '财政管理',
      href: '#/seller/accounts'
    }]

mainApp.controller 'buyerNavCtrl', ($scope) ->
  $scope.buyer_navs = [{
    image: '/img/buyer/nav-homepage.png',
    title: '首页',
    href: '/home'
  }, {
    image: '/img/buyer/nav-trolley.png',
    title: '分类',
    href: '/categories'
  }, {
    image: '/img/buyer/nav-orders.png',
    title: '购物车',
    href: '/cart'
  },

    {
      image: '/img/buyer/nav-profile.png',
      title: '我的账户',
      href: '/account'
    }]




