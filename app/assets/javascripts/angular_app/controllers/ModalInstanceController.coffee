app.controller "ModalInstanceCtrl", ["$scope","$modalInstance", ($scope, $modalInstance) ->

  $scope.ok = ->
    $modalInstance.dismiss "cancel"

  $scope.cancel = ->
    $modalInstance.dismiss "cancel"
]