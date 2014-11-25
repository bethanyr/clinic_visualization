app.controller "sideNavController", ["$scope", ($scope) ->

  $scope.setNavItem =(nav)->
    console.log(nav)
    $scope.nav_item = nav



]