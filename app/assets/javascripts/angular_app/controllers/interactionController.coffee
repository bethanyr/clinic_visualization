app.controller "interactionController", ["$scope", ($scope) ->
  
  $scope.viewInteractions =(drug)->
    console.log(drug)
    alert(drug.symptoms)


]