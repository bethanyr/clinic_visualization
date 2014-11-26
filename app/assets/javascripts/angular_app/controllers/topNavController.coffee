app.controller "topNavController", ["$scope", "Patient", "userData", ($scope, Patient, userData) ->

  $scope.patients = [] 
  $scope.selected_patient = ''


  $scope.init =()->
    $scope.patients = Patient.index() 
    
  $scope.init()

  $scope.changePatient =(new_patient)->
    console.log(new_patient.id)
    userData.update(id: $scope.selected_patient.id)

]