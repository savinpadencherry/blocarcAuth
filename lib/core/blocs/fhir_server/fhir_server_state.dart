part of 'fhir_server_bloc.dart';

class FhirServerState extends Equatable {
  const FhirServerState();

  @override
  List<Object> get props => [];
}

class FhirServerInitial extends FhirServerState {}

class FhirPatientServerLoading extends FhirServerState {}

class FhirPatientServerErrorState extends FhirServerState {
  final String message;

  const FhirPatientServerErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class FhirPatientServerSuccessState extends FhirServerState {
  final Patient patient;

  const FhirPatientServerSuccessState(this.patient);

  @override
  List<Object> get props => [patient];
}

// class FhirPatientServerLoaded extends FhirServerState {
//   final Patient patient;

//   FhirPatientServerLoaded(this.patient);

//   @override
//   List<Object> get props => [patient];
// }


