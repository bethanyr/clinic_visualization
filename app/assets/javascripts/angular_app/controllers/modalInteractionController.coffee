app.controller "modalInteractionController",["$scope","$modal", "$log", ($scope, $modal, $log) ->
  
  $scope.open = (size) ->
    modalInstance = $modal.open(
      templateUrl: "modalDrug.html"
      controller: "ModalInstanceCtrl"
      size: size
      scope: $scope
    )
]