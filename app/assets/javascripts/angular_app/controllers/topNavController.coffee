app.controller "topNavController", ["$scope", "Patient", ($scope, Patient) ->

  $scope.patients = [] 
  $scope.selected_patient = ''


  $scope.init =()->
    $scope.patients = Patient.index() 
    
  $scope.init()

  $scope.changePatient =(new_patient)->
    console.log(new_patient)

]