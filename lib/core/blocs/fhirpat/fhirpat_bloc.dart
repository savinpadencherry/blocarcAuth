// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fhirpat/core/models/appointmentmodel.dart';
import 'package:fhirpat/core/models/careplan.dart';
import 'package:fhirpat/core/models/claimmodel.dart';
import 'package:fhirpat/core/models/diagonisticreport.dart';
import 'package:fhirpat/core/models/medication_administration_model.dart';
import 'package:fhirpat/core/models/medication_request_model.dart';
import 'package:fhirpat/core/models/observation_model.dart';
// import 'package:fhirpat/core/models/observation_model.dart';
import 'package:fhirpat/core/models/patient_model.dart';

import 'package:fhirpat/core/repository/fhirpat_repository.dart';

part 'fhirpat_event.dart';
part 'fhirpat_state.dart';

class FhirpatBloc extends Bloc<FhirpatEvent, FhirpatState> {
  final FhirRepository fhirRepository;
  FhirpatBloc({required this.fhirRepository}) : super(FhirpatInitial()) {
    on<FhirpatPatientEvent>((event, emit) async {
      emit(FhirPatientLoadingState());
      try {
        final FhirPatientModel fhirPatientModel =
            await fhirRepository.entirePatientFlow(
                patientId: event.patientId,
                patientName: event.patientNam,
                patientFamilyName: event.patientFamilyName,
                patientPhone: event.patientPhone,
                patientGender: event.patientGender,
                patientAddressLine: event.patientAddressLine,
                patientAddressCity: event.patientAddressCountry,
                patientAddressPostCode: event.patientAddressPostCode,
                patientAddressCountry: event.patientAddressCountry,
                patientRelation: event.patientRelation,
                patientRelationFamilyName: event.patientRelationFamilyName,
                patientRelationPhone: event.patientRelationPhone,
                patientRelationAddress: event.patientRelationAddress,
                patientRelationGender: event.patientRelationGender,
                patientCommunication: event.patientCommunication,
                patientGeneralPractitioner: event.patientGeneralPractitioner,
                patientManagingOrganization: event.patientManagingOrganization,
                patientLink: event.patientLink,
                patientSuffix: event.patientSuffix,
                patientEmail: event.patientEmail,
                patientDoB: event.patientDoB,
                countryCode: event.countryCode,
                patientManagingOrganizationCode:
                    event.patientManagingOrganizationCode,
                deceased: event.deceased,
                xFileFhir: event.xfile);
        emit(
          FhirPatientFhirIdReceivedState(
            fhirPatientModel: fhirPatientModel,
          ),
        );
      } catch (e) {
        emit(
          FhirPatientErrorState(
            message: e.toString(),
          ),
        );
      }
    });
    on<FhirPatCreateObservationEvent>((event, emit) async {
      emit(FhirCreateObservationLoadingState());
      try {
        final ObservationModel observationModel =
            await fhirRepository.entireObservationFlow(
          existingPatientId: event.existingPatientId,
          patientName: event.patientName,
          practitionerName: event.practitionerName,
          condition: event.condition,
          status: event.status,
          typeCode: event.typeCode,
          typeValue: event.typeDisplay,
          valueCode: event.valueCode,
          valueUnit: event.valueUnit,
          identifier: event.identifier,
          valueQuantity: event.valueQuantity,
          conditionId: event.conditionId,
          practitionerId: event.practitionerId,
          interpretationCode: event.interpretationCode,
          interpretationDisplay: event.interpretationDisplay,
          observationId: event.observationId,
          lowReferenceRangeQuantityValue: event.lowReferenceRangeQuantityValue,
          lowReferenceRangeCodeValue: event.lowReferenceRangeCodeValue,
          lowReferenceRangeUnitValue: event.lowReferenceRangeUnitValue,
          highReferenceRangeCodeValue: event.highReferenceRangeCodeValue,
          highReferenceRangeQuantityValue:
              event.highReferenceRangeQuantityValue,
          highReferenceRangeUnitValue: event.highReferenceRangeUnitValue,
        );
        emit(
          FhirCreateObservationSuccessState(
            observationModel: observationModel,
          ),
        );
      } catch (e) {
        emit(
          const FhirCreateObservationErrorState(
            message: 'Invalid Attribute, Please check your form again',
          ),
        );
      }
    });
    on<FhirCreateCarePlanEvent>((event, emit) async {
      emit(FhirCreateCarePlanLoadingState());
      try {
        final CarePlanModel carePlanModel =
            await fhirRepository.entireCarePlanFlow(
          carePlanID: event.carePlanID,
          identifier: event.identifier,
          status: event.status,
          intent: event.intent,
          patientId: event.patientId,
          patientName: event.patientName,
          startPeriod: event.startPeriod,
          endPeriod: event.endPeriod,
          practitionerId: event.practitionerId,
          practitionerName: event.practitionerName,
          conditionID: event.conditionID,
          conditionName: event.conditionName,
          lifeCycleStatus: event.lifeCycleStatus,
          achievementStatus: event.achievementStatus,
          carePlanStatus: event.carePlanStatus,
          carePlanIntent: event.carePlanIntent,
          achievementStatusCode: event.achievementStatusCode,
          description: event.description,
          note: event.note,
          activityPlannedReference: event.activityPlannedReference,
          activityStatus: event.activityStatus,
          activityIntent: event.activityIntent,
          activityCode: event.activityCode,
          activityDisplay: event.activityDisplay,
          occurenceTime: event.occurenceDate,
        );
        emit(
          FhirCreateCarePlanSuccessState(carePlanModel: carePlanModel),
        );
      } catch (e) {
        emit(
          FhirCreateCarePlanErrorState(
            message: e.toString(),
          ),
        );
      }
    });

    on<FhirPatCreateMedicationRequestEvent>((event, emit) async {
      emit(FhirCreateMedicationRequestLoadingState());
      try {
        final MedicationRequestModel medicationRequestModel =
            await fhirRepository.entireMedicationRequest(
          medicationRequestId: event.medicationRequestId,
          medicationId: event.medicationId,
          medicationCode: event.medicationCode,
          medicationDisplay: event.medicationDisplay,
          medicineCode: event.medicineCode,
          medicineName: event.medicineName,
          identifier: event.identifier,
          status: event.status,
          intent: event.intent,
          categoryCode: event.categoryCode,
          categoryDisplay: event.categoryDisplay,
          patientId: event.patientId,
          patientName: event.patientName,
          encounterId: event.encounterId,
          encounterDisplay: event.encounterDisplay,
          supportingInfoProcedure: event.supportingInfoProcedure,
          authoredOnDate: event.authoredOnDate,
          practitionerName: event.practitionerName,
          practitionerId: event.practitionerId,
          reasonCode: event.reasonCode,
          reasonDisplay: event.reasonDisplay,
          notes: event.notes,
          dosageInstruction: event.dosageInstruction,
          dosageInstructionCode: event.dosageInstructionCode,
          additionalDosageInstructionText:
              event.additionalDosageInstructionText,
          frequency: event.frequency,
          period: event.period,
          periodUnit: event.periodUnit,
          when: event.when,
          routeCode: event.routeCode,
          routeMessage: event.routeMessage,
          methodText: event.methodText,
          methodCode: event.methodCode,
          doseRateTypeCode: event.doseRateTypeCode,
          doseRateTypeDisplay: event.doseRateTypeDisplay,
          doseRangeLowValue: event.doseRangeLowValue,
          doseRangeLowUnit: event.doseRangeLowUnit,
          doseRangeLowCode: event.doseRangeLowCode,
          doseRangeHighValue: event.doseRangeHighValue,
          doseRangeHighUnit: event.doseRangeHighUnit,
          doseRangeHighCode: event.doseRangeHighCode,
          dispenseRequestStartDate: event.dispenseRequestStartDate,
          dispenseRequestEndDate: event.dispenseRequestEndDate,
          dispenseRequestNumberOfRequests:
              event.dispenseRequestNumberOfRequests,
          dispenseRequestQuantityValue: event.dispenseRequestQuantityValue,
          dispenseRequestQuantityUnit: event.dispenseRequestQuantityUnit,
          dispenseRequestQuantityCode: event.dispenseRequestQuantityCode,
          expectedSupplyDurationValue: event.expectedSupplyDurationValue,
          expectedSupplyDurationUnit: event.expectedSupplyDurationUnit,
          expectedSupplyDurationCode: event.expectedSupplyDurationCode,
          substitutionAllowed: event.substitutionAllowed,
          substitutionAllowedCode: event.substitutionAllowedCode,
          substitutionAllowedDisplay: event.substitutionAllowedDisplay,
        );
        emit(FhirCreateMedicationRequestSuccessState(
            medicationRequestModel: medicationRequestModel));
      } catch (e) {
        emit(
          FhirCreateMedicationRequestErrorState(
            message: e.toString(),
          ),
        );
      }
    });

    on<FhirCreateMedicationAdministrationEvent>((event, emit) async {
      emit(FhirCreateMedicationAdministrationLoadingState());
      try {
        final MedicationAdministrationModel medicationAdministrationModel =
            await fhirRepository.entireMedicationAdministrationFlow(
          medicationAdministrationId: event.medicationAdministrationId,
          medicationId: event.medicationId,
          medicineCode: event.medicineCode,
          medicineName: event.medicineName,
          status: event.status,
          medicationReferenceRequestId: event.medicationReferenceRequestId,
          patientName: event.patientName,
          patientId: event.patientId,
          encounterId: event.encounterId,
          encounterDisplay: event.encounterDisplay,
          occurenceStartPeriod: event.occurenceStartPeriod,
          occurenceEndPeriod: event.occurenceEndPeriod,
          practitionerId: event.practitionerId,
          practitionerName: event.practitionerName,
          dosageText: event.dosageText,
          routeCode: event.routeCode,
          routeName: event.routeName,
          doseValue: event.doseValue,
          doseUnit: event.doseUnit,
          doseCode: event.doseCode,
          rateRatioValue: event.rateRatioValue,
          rateRatioCode: event.rateRatioCode,
          denominatorValue: event.denominatorValue,
          denominatorCode: event.denominatorCode,
        );
        emit(
          FhirCreateMedicationAdministrationSuccessState(
            medicationAdministrationModel: medicationAdministrationModel,
          ),
        );
      } catch (e) {
        emit(
          FhirCreateMedicationAdministrationErrorState(
            message: e.toString(),
          ),
        );
      }
    });

    on<FhirCreateDiagnosticReportEvent>((event, emit) async {
      emit(FhirCreateDiagnosticReportLoadingState());
      try {
        final DiagnosticReportModel diagnosticReportModel =
            await fhirRepository.entireDiagnosticReportServices(
          diagonisticReportId: event.diagonisticReportId,
          diagonisticReportStudyType: event.diagonisticReportStudyType,
          diagonisticReportStudyId: event.diagonisticReportStudyId,
          diagonisticReportStatus: event.diagonisticReportStatus,
          patientId: event.patientId,
          description: event.description,
          categoryCode: event.categoryCode,
          categoryDisplay: event.categoryDisplay,
          status: event.status,
          typeOfDiagnosticTestCode: event.typeOfDiagnosticTestCode,
          typeOfDiagnosticTestDisplay: event.typeOfDiagnosticTestDisplay,
          patientName: event.patientName,
          organizationId: event.organizationId,
          organizationName: event.organizationName,
          conclusion: event.conclusion,
          conclusionCode: event.conclusionCode,
          conclusionDisplay: event.conclusionDisplay,
          effectiveDateTime: event.effectiveDateTime,
          issued: event.issued,
        );
        emit(
          FhirCreateDiagnosticReportSuccessState(
              diagnosticReportModel: diagnosticReportModel),
        );
      } catch (e) {
        emit(
          FhirCreateCarePlanErrorState(
            message: e.toString(),
          ),
        );
      }
    });

    on<FhirCreateAppointmentEvent>((event, emit) async {
      emit(FhirCreateAppointmentLoadingState());
      try {
        final AppointmentModel appointmentModel =
            await fhirRepository.entireAppointmentFlow(
          status: event.status,
          actCode: event.actCode,
          actDisplay: event.actDisplay,
          serviceCategoryCode: event.serviceCategoryCode,
          serviceCategoryDisplay: event.serviceCategoryDisplay,
          serviceTypeCode: event.serviceTypeCode,
          serviceTypeDisplay: event.serviceTypeDisplay,
          specialtyCode: event.specialtyCode,
          specialtyDisplay: event.specialtyDisplay,
          appointmentTypeCode: event.appointmentTypeCode,
          appointmentTypeDisplay: event.appointmentTypeDisplay,
          reasonDisplay: event.reasonDisplay,
          description: event.description,
          startDate: event.startDate,
          endDate: event.endDate,
          createdDate: event.createdDate,
          note: event.note,
          patientInstructionText: event.patientInstructionText,
          serviceRequest: event.serviceRequest,
          patientName: event.patientName,
          patientRequired: event.patientRequired,
          patientStatus: event.patientStatus,
          practitionerStatus: event.practitionerStatus,
          practitionerName: event.practitionerName,
          practitionerRequired: event.practitionerRequired,
          location: event.location,
          locationRequired: event.locationRequired,
          locationStatus: event.locationStatus,
          type: event.type,
        );
        emit(FhirCreateAppointmentSuccessState(
            appointmentModel: appointmentModel));
      } catch (e) {
        emit(
          FhirCreateAppointmentErrorState(
            message: e.toString(),
          ),
        );
      }
    });

    on<FhirCreateClaimEvent>((event, emit) async {
      emit(FhirCreateClaimLoadingState());
      try {
        final ClaimDataModel claimModel = await fhirRepository.entireClaimFlow(
          claimID: event.claimID,
          patientId: event.patientId,
          patientFamilyName: event.patientFamilyName,
          patientName: event.patientName,
          patientGender: event.patientGender,
          patientDOB: event.patientDOB,
          patientPhoneNumber: event.patientPhoneNumber,
          patientEmail: event.patientEmail,
          patientAddress: event.patientAddress,
          patientCity: event.patientCity,
          patientLineAddress: event.patientLineAddress,
          patientCityAddress: event.patientCityAddress,
          patientStateAdress: event.patientStateAdress,
          patientCountryAdress: event.patientCountryAdress,
          patientPostalCode: event.patientPostalCode,
          coverageId: event.coverageId,
          coverageIdentifierValue: event.coverageIdentifierValue,
          coverageStatus: event.coverageStatus,
          coverageValue: event.coverageValue,
          coverageKind: event.coverageKind,
          coverageTypeCode: event.coverageTypeCode,
          coverageTypeDisplay: event.coverageTypeDisplay,
          relationshipCode: event.relationshipCode,
          startDate: event.startDate,
          endDate: event.endDate,
          insurerId: event.insurerId,
          insurerDisplay: event.insurerDisplay,
          classCode: event.classCode,
          classValue: event.classValue,
          use: event.use,
          typeCode: event.typeCode,
          subTypeCode: event.subTypeCode,
          subTypeName: event.subTypeName,
          status: event.status,
          organizationId: event.organizationId,
          priorityCode: event.priorityCode,
          payeeCode: event.payeeCode,
          practitionerName: event.practitionerName,
          patientStatusCode: event.patientStatusCode,
          diagnosisCode: event.diagnosisCode,
          diagnosisDisplay: event.diagnosisDisplay,
          insuranceFocal: event.insuranceFocal,
          insuranceId: event.insuranceId,
          careTeamSequence: event.careTeamSequence,
          informationSequence: event.informationSequence,
          serviceCode: event.serviceCode,
          serviceDisplay: event.serviceDisplay,
          servicedDate: event.servicedDate,
          locationCode: event.locationCode,
          locationDisplay: event.locationDisplay,
          unitPrice: event.unitPrice,
          currency: event.currency,
          netValue: event.netValue,
          totalValue: event.totalValue,
        );
        emit(FhirCreateClaimSuccessState(claimModel: claimModel,),);
      } catch (e) {
        rethrow;
      }
    });
  }
}
