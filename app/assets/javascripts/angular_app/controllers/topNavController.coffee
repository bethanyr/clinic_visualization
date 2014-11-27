app.controller "topNavController", ["$scope", "Patient", "userData", ($scope, Patient, userData) ->

  $scope.patients = [] 
  $scope.selected_patient = ''


  $scope.init =()->
    $scope.patients = Patient.index() 
    
  $scope.init()

  $scope.changePatient =(patient_id)->
    console.log($scope.patients[patient_id].name)
    userData.update(id: $scope.patients[patient_id].id)

  $scope.viewInteractions =(drug)->
    console.log(drug)

  $scope.toggleDropdown = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.status.isopen = not $scope.status.isopen


]