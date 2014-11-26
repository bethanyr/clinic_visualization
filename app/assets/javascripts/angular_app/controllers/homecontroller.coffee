app.controller "homeController", ["$scope", ($scope) ->
  $scope.showMedConditions = false

  $scope.setHeader =(title)->
    if $scope.showMedConditions
      '> ' + title 
    else 
      '^ ' + title






]