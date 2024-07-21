// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fhirpat_bloc.dart';

class FhirpatState extends Equatable {
  const FhirpatState();

  @override
  List<Object> get props => [];
}

class FhirpatInitial extends FhirpatState {}

class FhirPatientLoadingState extends FhirpatState {}

class FhirPatientErrorState extends FhirpatState {
  final String message;

  const FhirPatientErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class FhirPatientFhirIdReceivedState extends FhirpatState {
  final FhirPatientModel fhirPatientModel;

  const FhirPatientFhirIdReceivedState({required this.fhirPatientModel});
  @override
  List<Object> get props => [fhirPatientModel];
}

class FhirPatientPatchingLoadingState extends FhirpatState {}

class FhirPatientPatchingErrorState extends FhirpatState {}

class FhirPatientPatchingIdSuccessState extends FhirpatState {
  final FhirPatientModel fhirPatientModel;

  const FhirPatientPatchingIdSuccessState({required this.fhirPatientModel});
  @override
  List<Object> get props => [fhirPatientModel];
}

class FhirCreateObservationSuccessState extends FhirpatState {
  final ObservationModel observationModel;
  const FhirCreateObservationSuccessState({required this.observationModel});
  @override
  List<Object> get props => [observationModel];
}

class FhirCreateObservationErrorState extends FhirpatState {
  final String message;
  const FhirCreateObservationErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class FhirCreateObservationLoadingState extends FhirpatState {}

class FhirCreateCarePlanLoadingState extends FhirpatState {}

class FhirCreateCarePlanErrorState extends FhirpatState {
  final String message;
  const FhirCreateCarePlanErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class FhirCreateCarePlanSuccessState extends FhirpatState {
  final CarePlanModel carePlanModel;

  const FhirCreateCarePlanSuccessState({required this.carePlanModel});
  @override
  List<Object> get props => [carePlanModel];
}

class FhirCreateMedicationRequestLoadingState extends FhirpatState {}

class FhirCreateMedicationRequestErrorState extends FhirpatState {
  final String message;
  const FhirCreateMedicationRequestErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class FhirCreateMedicationRequestSuccessState extends FhirpatState {
  final MedicationRequestModel medicationRequestModel;

  const FhirCreateMedicationRequestSuccessState(
      {required this.medicationRequestModel});
  @override
  List<Object> get props => [medicationRequestModel];
}

class FhirCreateMedicationAdministrationLoadingState extends FhirpatState {}

class FhirCreateMedicationAdministrationErrorState extends FhirpatState {
  final String message;

  const FhirCreateMedicationAdministrationErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class FhirCreateMedicationAdministrationSuccessState extends FhirpatState {
  final MedicationAdministrationModel medicationAdministrationModel;
  const FhirCreateMedicationAdministrationSuccessState({
    required this.medicationAdministrationModel,
  });
  @override
  List<Object> get props => [medicationAdministrationModel];
}

class FhirCreateDiagnosticReportLoadingState extends FhirpatState {}

class FhirCreateDiagnosticReportSuccessState extends FhirpatState {
  final DiagnosticReportModel diagnosticReportModel;

  const FhirCreateDiagnosticReportSuccessState(
      {required this.diagnosticReportModel});

  @override
  List<Object> get props => [diagnosticReportModel];
}

class FhirCreateDiagnosticReportErrorState extends FhirpatState {
  final String message;

  const FhirCreateDiagnosticReportErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class FhirCreateAppointmentLoadingState extends FhirpatState {}

class FhirCreateAppointmentErrorState extends FhirpatState {
  final String message;

  const FhirCreateAppointmentErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class FhirCreateAppointmentSuccessState extends FhirpatState {
  final AppointmentModel appointmentModel;

  const FhirCreateAppointmentSuccessState({required this.appointmentModel});
  @override
  List<Object> get props => [appointmentModel];
}

class FhirCreateClaimLoadingState extends FhirpatState {}

class FhirCreateClaimErrorState extends FhirpatState {
  final String message;
  const FhirCreateClaimErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class FhirCreateClaimSuccessState extends FhirpatState {
  final ClaimDataModel claimModel;
  const FhirCreateClaimSuccessState({required this.claimModel});
  @override
  List<Object> get props => [claimModel];
}
