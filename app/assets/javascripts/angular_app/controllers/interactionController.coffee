app.controller "interactionController", ["$scope","$modal", ($scope, $modal) ->
  
  $scope.viewInteractions =(drug)->
    console.log(drug)
    alert(drug.symptoms)

  $scope.open = (size) ->
    modalInstance = $modal.open(
      templateUrl: "modalDrug.html"
      controller: "ModalInstanceCtrl"
      size: size
      scope: $scope
    )

  $scope.tabs = [
    { title:'Current Medication', content:'Dynamic content 1' },
    { title:'Previous Medication', content:'Dynamic content 2', disabled: true }
  ];

]

