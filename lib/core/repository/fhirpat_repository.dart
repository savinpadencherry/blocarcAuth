import 'dart:convert';
import 'dart:io';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/appointmentmodel.dart';
import 'package:fhirpat/core/models/careplan.dart';
import 'package:fhirpat/core/models/claimmodel.dart';
import 'package:fhirpat/core/models/diagonisticreport.dart';
import 'package:fhirpat/core/models/medication_request_model.dart';
import 'package:fhirpat/core/models/observation_model.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/services/appointment.dart';
import 'package:fhirpat/core/services/claim.dart';
import 'package:fhirpat/core/services/diagnosticreportservice.dart';
import 'package:fhirpat/core/services/medicationadministration.dart';
import 'package:fhirpat/core/services/medicationrequest.dart';
import 'package:fhirpat/core/services/observationresource.dart';
import 'package:fhirpat/core/services/patientresource.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../models/medication_administration_model.dart';
import '../services/careplanresource.dart';

class FhirRepository with LogMixin {
  final PatientResourceService patientResourceService =
      PatientResourceService();

  final ObservationResource observationResource = ObservationResource();

  final ClaimService claimService = ClaimService();

  final CarePlanResourceService carePlanResourceService =
      CarePlanResourceService();

  final MedicationRequestService medicationRequestService =
      MedicationRequestService();

  final MedicationAdministrationService medicationAdministrationService =
      MedicationAdministrationService();

  final DiagonisticReportService diagonisticReportService =
      DiagonisticReportService();

  final AppointmentService appointmentService = AppointmentService();
  final ImagePicker _imagePicker = ImagePicker();
  List<ObservationModel> localObservationModel = [];
  List<CarePlanModel> localCarePlanModels = [];
  List<FhirPatientModel> fhirPatientModel = [];
  List<MedicationRequestModel> localMedicationRequestModel = [];
  List<MedicationAdministrationModel> localMedicationAdministrationModel = [];
  List<DiagnosticReportModel> localDiagnosticReportModel = [];
  List<AppointmentModel> localAppointmentModels = [];
  List<ClaimDataModel> localClaimModel = [];

  List<AppointmentModel> get appointmentModel {
    return localAppointmentModels;
  }

  List<DiagnosticReportModel> get diagnosticReportModel {
    return localDiagnosticReportModel;
  }

  List<ClaimDataModel> get claimDataModel {
    return localClaimModel;
  }

  List<MedicationAdministrationModel> get medicationAdministrationModel {
    return localMedicationAdministrationModel;
  }

  List<MedicationRequestModel> get medicationRequestModels {
    return localMedicationRequestModel;
  }

  List<FhirPatientModel> get fhirPatModel {
    return fhirPatientModel;
  }

  List<ObservationModel> get observationModels {
    return localObservationModel;
  }

  List<CarePlanModel> get carePlanModels {
    return localCarePlanModels;
  }

  Future<XFile?> handlecameraOpening() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 70);
    warningLog('Image $image');
    return image;
  }

  Future<XFile?> handleGallerOpening() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 70);
    debugLog('$image');
    return image;
  }

  Future<FhirPatientModel> entirePatientFlow({
    required String patientId,
    required String patientName,
    required String patientFamilyName,
    required String patientPhone,
    required String patientGender,
    required String patientAddressLine,
    required String patientAddressCity,
    required String patientAddressPostCode,
    required String patientAddressCountry,
    required String patientRelation,
    required String patientRelationFamilyName,
    required String patientRelationPhone,
    required String patientRelationAddress,
    required String patientRelationGender,
    required String patientCommunication,
    required String patientGeneralPractitioner,
    required String patientManagingOrganization,
    required String patientLink,
    required String patientSuffix,
    required String patientEmail,
    required String patientDoB,
    required String countryCode,
    required String patientManagingOrganizationCode,
    required File xFileFhir,
    required bool deceased,
  }) async {
    final FhirPatientModel fhirPatientModel =
        await patientResourceService.sendPatientDetailsToHapi(
            patientId: patientId,
            patientName: patientName,
            patientFamilyName: patientFamilyName,
            patientPhone: patientPhone,
            patientGender: patientGender,
            patientAddressLine: patientAddressLine,
            patientAddressCity: patientAddressCity,
            patientAddressPostCode: patientAddressPostCode,
            patientAddressCountry: patientAddressCountry,
            patientRelation: patientRelation,
            patientRelationFamilyName: patientRelationFamilyName,
            patientRelationPhone: patientRelationPhone,
            patientRelationAddress: patientRelationAddress,
            patientRelationGender: patientRelationGender,
            patientCommunication: patientCommunication,
            patientGeneralPractitioner: patientGeneralPractitioner,
            patientManagingOrganization: patientManagingOrganization,
            patientLink: patientLink,
            patientSuffix: patientSuffix,
            patientEmail: patientEmail,
            patientDoB: patientDoB,
            countryCode: countryCode,
            patientManagingOrganizationCode: patientManagingOrganizationCode,
            xFileFhir: xFileFhir,
            deceased: deceased);
    return fhirPatientModel;
  }

  Future<ObservationModel> entireObservationFlow({
    required String existingPatientId,
    required String patientName,
    required String practitionerName,
    required String condition,
    required String status,
    required String typeCode,
    required String typeValue,
    required String valueQuantity,
    required String observationId,
    required String conditionId,
    required String practitionerId,
    required String interpretationCode,
    required String interpretationDisplay,
    required String valueUnit,
    required String valueCode,
    required dynamic lowReferenceRangeQuantityValue,
    required String lowReferenceRangeUnitValue,
    required dynamic lowReferenceRangeCodeValue,
    required dynamic highReferenceRangeQuantityValue,
    required String highReferenceRangeUnitValue,
    required dynamic highReferenceRangeCodeValue,
    required String identifier,
    String? methodCode,
    String? methodText,
  }) async {
    final ObservationModel observationModel =
        await observationResource.sendObservationDetailsToHapi(
      existingPatientId: existingPatientId,
      patientName: patientName,
      practitionerName: practitionerName,
      condition: condition,
      status: status,
      typeCode: typeCode,
      typeValue: typeValue,
      valueQuantity: valueQuantity,
      observationId: observationId,
      conditionId: conditionId,
      practitionerId: practitionerId,
      interpretationCode: interpretationCode,
      interpretationDisplay: interpretationDisplay,
      valueUnit: valueUnit,
      valueCode: valueCode,
      lowReferenceRangeQuantityValue: lowReferenceRangeQuantityValue,
      lowReferenceRangeUnitValue: lowReferenceRangeUnitValue,
      lowReferenceRangeCodeValue: lowReferenceRangeCodeValue,
      highReferenceRangeQuantityValue: highReferenceRangeQuantityValue,
      highReferenceRangeUnitValue: highReferenceRangeUnitValue,
      highReferenceRangeCodeValue: highReferenceRangeCodeValue,
      identifier: identifier,
    );
    return observationModel;
  }

  Future<CarePlanModel> entireCarePlanFlow(
      {required String carePlanID,
      required String identifier,
      required String status,
      required String intent,
      required String patientId,
      required String patientName,
      required String startPeriod,
      required String endPeriod,
      required String practitionerId,
      required String practitionerName,
      required String conditionID,
      required String conditionName,
      required String lifeCycleStatus,
      required String achievementStatus,
      required String carePlanStatus,
      required String carePlanIntent,
      required String achievementStatusCode,
      required String description,
      required String note,
      required String activityPlannedReference,
      required String activityStatus,
      required String activityIntent,
      required String activityCode,
      required String activityDisplay,
      required String occurenceTime}) async {
    final CarePlanModel carePlanModel =
        await carePlanResourceService.sendCarePlanToHapiServer(
      carePlanID: carePlanID,
      identifier: identifier,
      status: status,
      intent: intent,
      patientId: patientId,
      patientName: patientName,
      startPeriod: startPeriod,
      endPeriod: endPeriod,
      practitionerId: practitionerId,
      practitionerName: practitionerName,
      conditionID: conditionID,
      conditionName: conditionName,
      lifeCycleStatus: lifeCycleStatus,
      achievementStatus: achievementStatus,
      carePlanStatus: carePlanStatus,
      carePlanIntent: carePlanIntent,
      achievementStatusCode: achievementStatusCode,
      description: description,
      note: note,
      activityPlannedReference: activityPlannedReference,
      activityStatus: activityStatus,
      activityIntent: activityIntent,
      activityCode: activityCode,
      activityDisplay: activityDisplay,
      occurenceTime: occurenceTime,
    );
    return carePlanModel;
  }

  Future<MedicationRequestModel> entireMedicationRequest({
    required String medicationRequestId,
    required String medicationId,
    required String medicationCode,
    required String medicationDisplay,
    required String medicineCode,
    required String medicineName,
    required String? identifier,
    required String status,
    required String? intent,
    required String? categoryCode,
    required String? categoryDisplay,
    required String? patientId,
    required String? patientName,
    required String? encounterId,
    required String? encounterDisplay,
    required String? supportingInfoProcedure,
    required String? authoredOnDate,
    required String? practitionerName,
    required String? practitionerId,
    required String? reasonCode,
    required String? reasonDisplay,
    required String? notes,
    required String? dosageInstruction,
    required String? dosageInstructionCode,
    required String? additionalDosageInstructionText,
    required int? frequency,
    required int? period,
    required String? periodUnit,
    required String? when,
    required String? routeCode,
    required String? routeMessage,
    required String? methodText,
    required String? methodCode,
    required String? doseRateTypeCode,
    required String? doseRateTypeDisplay,
    required int? doseRangeLowValue,
    required String? doseRangeLowUnit,
    required String? doseRangeLowCode,
    required int? doseRangeHighValue,
    required String? doseRangeHighUnit,
    required String? doseRangeHighCode,
    required String? dispenseRequestStartDate,
    required String? dispenseRequestEndDate,
    required String? dispenseRequestNumberOfRequests,
    required int? dispenseRequestQuantityValue,
    required String? dispenseRequestQuantityUnit,
    required String? dispenseRequestQuantityCode,
    required int? expectedSupplyDurationValue,
    required String? expectedSupplyDurationUnit,
    required String? expectedSupplyDurationCode,
    required bool? substitutionAllowed,
    required String? substitutionAllowedCode,
    required String? substitutionAllowedDisplay,
  }) async {
    final MedicationRequestModel medicationRequestModel =
        await medicationRequestService.sendMedicationRequestToHapi(
      medicationRequestId: medicationRequestId,
      medicationId: medicationId,
      medicationCode: medicationCode,
      medicationDisplay: medicationDisplay,
      medicineCode: medicineCode,
      medicineName: medicineName,
      identifier: identifier,
      status: status,
      intent: intent,
      categoryCode: categoryCode,
      categoryDisplay: categoryDisplay,
      patientId: patientId,
      patientName: patientName,
      encounterId: encounterId,
      encounterDisplay: encounterDisplay,
      supportingInfoProcedure: supportingInfoProcedure,
      authoredOnDate: authoredOnDate,
      practitionerName: practitionerName,
      practitionerId: practitionerId,
      reasonCode: reasonCode,
      reasonDisplay: reasonDisplay,
      notes: notes,
      dosageInstruction: dosageInstruction,
      dosageInstructionCode: dosageInstructionCode,
      additionalDosageInstructionText: additionalDosageInstructionText,
      frequency: frequency,
      period: period,
      periodUnit: periodUnit,
      when: when,
      routeCode: routeCode,
      routeMessage: routeMessage,
      methodText: methodText,
      methodCode: methodCode,
      doseRateTypeCode: doseRateTypeCode,
      doseRateTypeDisplay: doseRateTypeDisplay,
      doseRangeLowValue: doseRangeLowValue,
      doseRangeLowUnit: doseRangeLowUnit,
      doseRangeLowCode: doseRangeLowCode,
      doseRangeHighValue: doseRangeHighValue,
      doseRangeHighUnit: doseRangeHighUnit,
      doseRangeHighCode: doseRangeHighCode,
      dispenseRequestStartDate: dispenseRequestStartDate,
      dispenseRequestEndDate: dispenseRequestEndDate,
      dispenseRequestNumberOfRequests: dispenseRequestNumberOfRequests,
      dispenseRequestQuantityValue: dispenseRequestQuantityValue,
      dispenseRequestQuantityUnit: dispenseRequestQuantityUnit,
      dispenseRequestQuantityCode: dispenseRequestQuantityCode,
      expectedSupplyDurationValue: expectedSupplyDurationValue,
      expectedSupplyDurationUnit: expectedSupplyDurationUnit,
      expectedSupplyDurationCode: expectedSupplyDurationCode,
      substitutionAllowed: substitutionAllowed,
      substitutionAllowedCode: substitutionAllowedCode,
      substitutionAllowedDisplay: substitutionAllowedDisplay,
    );
    return medicationRequestModel;
  }

  Future<MedicationAdministrationModel> entireMedicationAdministrationFlow({
    required String medicationAdministrationId,
    required String medicationId,
    required String medicineCode,
    required String medicineName,
    required String status,
    required String medicationReferenceRequestId,
    required String patientName,
    required String patientId,
    required String encounterId,
    required String encounterDisplay,
    required String occurenceStartPeriod,
    required String occurenceEndPeriod,
    required String practitionerId,
    required String practitionerName,
    required String dosageText,
    required String routeCode,
    required String routeName,
    required int doseValue,
    required String doseUnit,
    required String doseCode,
    required int rateRatioValue,
    required String rateRatioCode,
    required int denominatorValue,
    required String denominatorCode,
  }) async {
    final MedicationAdministrationModel medicationAdministrationModel =
        await medicationAdministrationService
            .createMedicationAdministrationInHapi(
      medicationAdministrationId: medicationAdministrationId,
      medicationId: medicationId,
      medicineCode: medicineCode,
      medicineName: medicineName,
      status: status,
      medicationReferenceRequestId: medicationReferenceRequestId,
      patientName: patientName,
      patientId: patientId,
      encounterId: encounterId,
      encounterDisplay: encounterDisplay,
      occurenceStartPeriod: occurenceStartPeriod,
      occurenceEndPeriod: occurenceEndPeriod,
      practitionerId: practitionerId,
      practitionerName: practitionerName,
      dosageText: dosageText,
      routeCode: routeCode,
      routeName: routeName,
      doseValue: doseValue,
      doseUnit: doseUnit,
      doseCode: doseCode,
      rateRatioValue: rateRatioValue,
      rateRatioCode: rateRatioCode,
      denominatorValue: denominatorValue,
      denominatorCode: denominatorCode,
    );
    return medicationAdministrationModel;
  }

  Future<DiagnosticReportModel> entireDiagnosticReportServices({
    required String diagonisticReportId,
    required String diagonisticReportStudyType,
    required String diagonisticReportStudyId,
    required String diagonisticReportStatus,
    required String patientId,
    required String description,
    required String categoryCode,
    required String categoryDisplay,
    required String status,
    required String typeOfDiagnosticTestCode,
    required String typeOfDiagnosticTestDisplay,
    required String patientName,
    required String organizationId,
    required String organizationName,
    required String conclusion,
    required String conclusionCode,
    required String conclusionDisplay,
    required String effectiveDateTime,
    required String issued,
  }) async {
    final DiagnosticReportModel diagnosticReportModel =
        await diagonisticReportService.sendDiagonisticReportToHapi(
      diagonisticReportId: diagonisticReportId,
      diagonisticReportStudyType: diagonisticReportStudyType,
      diagonisticReportStudyId: diagonisticReportStudyId,
      diagonisticReportStatus: diagonisticReportStatus,
      patientId: patientId,
      description: description,
      categoryCode: categoryCode,
      categoryDisplay: categoryDisplay,
      status: status,
      typeOfDiagnosticTestCode: typeOfDiagnosticTestCode,
      typeOfDiagnosticTestDisplay: typeOfDiagnosticTestDisplay,
      patientName: patientName,
      organizationId: organizationId,
      organizationName: organizationName,
      conclusion: conclusion,
      conclusionCode: conclusionCode,
      conclusionDisplay: conclusionDisplay,
      effectiveDateTime: effectiveDateTime,
      issued: issued,
    );
    return diagnosticReportModel;
  }

  Future<AppointmentModel> entireAppointmentFlow({
    required String status,
    required String actCode,
    required String actDisplay,
    required String serviceCategoryCode,
    required String serviceCategoryDisplay,
    required String serviceTypeCode,
    required String serviceTypeDisplay,
    required String specialtyCode,
    required String specialtyDisplay,
    required String appointmentTypeCode,
    required String appointmentTypeDisplay,
    required String reasonDisplay,
    required String description,
    required String startDate,
    required String endDate,
    required String createdDate,
    required String note,
    required String patientInstructionText,
    required String serviceRequest,
    required String patientName,
    required String patientRequired,
    required String patientStatus,
    required String practitionerStatus,
    required String practitionerName,
    required String practitionerRequired,
    required String location,
    required String locationRequired,
    required String locationStatus,
    required String type,
  }) async {
    final AppointmentModel appointmentModel =
        await appointmentService.sendAppointmentDetails(
      status: status,
      actCode: actCode,
      actDisplay: actDisplay,
      serviceCategoryCode: serviceCategoryCode,
      serviceCategoryDisplay: serviceCategoryDisplay,
      serviceTypeCode: serviceTypeCode,
      serviceTypeDisplay: serviceTypeDisplay,
      specialtyCode: specialtyCode,
      specialtyDisplay: specialtyDisplay,
      appointmentTypeCode: appointmentTypeCode,
      appointmentTypeDisplay: appointmentTypeDisplay,
      reasonDisplay: reasonDisplay,
      description: description,
      startDate: startDate,
      endDate: endDate,
      createdDate: createdDate,
      note: note,
      patientInstructionText: patientInstructionText,
      serviceRequest: serviceRequest,
      patientName: patientName,
      patientRequired: patientRequired,
      patientStatus: patientStatus,
      practitionerStatus: practitionerStatus,
      practitionerName: practitionerName,
      practitionerRequired: practitionerRequired,
      location: location,
      locationRequired: locationRequired,
      locationStatus: locationStatus,
      type: type,
    );
    return appointmentModel;
  }

  Future<ClaimDataModel> entireClaimFlow({
    required String claimID,
    required String patientId,
    required String patientFamilyName,
    required String patientName,
    required String patientGender,
    required String patientDOB,
    required String patientPhoneNumber,
    required String patientEmail,
    required String patientAddress,
    required String patientCity,
    required String patientLineAddress,
    required String patientCityAddress,
    required String patientStateAdress,
    required String patientCountryAdress,
    required String patientPostalCode,
    required String coverageId,
    required String coverageIdentifierValue,
    required String coverageStatus,
    required String coverageValue,
    required String coverageKind,
    required String coverageTypeCode,
    required String coverageTypeDisplay,
    required String relationshipCode,
    required String startDate,
    required String endDate,
    required String insurerId,
    required String insurerDisplay,
    required String classCode,
    required String classValue,
    required String use,
    required String typeCode,
    required String subTypeCode,
    required String subTypeName,
    required String status,
    required String organizationId,
    required String priorityCode,
    required String payeeCode,
    required String practitionerName,
    required String patientStatusCode,
    required String diagnosisCode,
    required String diagnosisDisplay,
    required String insuranceFocal,
    required String insuranceId,
    required String careTeamSequence,
    required String informationSequence,
    required String serviceCode,
    required String serviceDisplay,
    required String servicedDate,
    required String locationCode,
    required String locationDisplay,
    required double unitPrice,
    required String currency,
    required double netValue,
    required double totalValue,
  }) async {
    final ClaimDataModel claimDataModel =
        await claimService.sendClaimDetailsToHapi(
            claimID: claimID,
            patientId: patientId,
            patientFamilyName: patientFamilyName,
            patientName: patientName,
            patientGender: patientGender,
            patientDOB: patientDOB,
            patientPhoneNumber: patientPhoneNumber,
            patientEmail: patientEmail,
            patientAddress: patientAddress,
            patientCity: patientCity,
            patientLineAddress: patientLineAddress,
            patientCityAddress: patientCityAddress,
            patientStateAdress: patientStateAdress,
            patientCountryAdress: patientCountryAdress,
            patientPostalCode: patientPostalCode,
            coverageId: coverageId,
            coverageIdentifierValue: coverageIdentifierValue,
            coverageStatus: coverageStatus,
            coverageValue: coverageValue,
            coverageKind: coverageKind,
            coverageTypeCode: coverageTypeCode,
            coverageTypeDisplay: coverageTypeDisplay,
            relationshipCode: relationshipCode,
            startDate: startDate,
            endDate: endDate,
            insurerId: insurerId,
            insurerDisplay: insurerDisplay,
            classCode: classCode,
            classValue: classValue,
            use: use,
            typeCode: typeCode,
            subTypeCode: subTypeCode,
            subTypeName: subTypeName,
            status: status,
            organizationId: organizationId,
            priorityCode: priorityCode,
            payeeCode: payeeCode,
            practitionerName: practitionerName,
            patientStatusCode: patientStatusCode,
            diagnosisCode: diagnosisCode,
            diagnosisDisplay: diagnosisDisplay,
            insuranceFocal: insuranceFocal,
            insuranceId: insuranceId,
            careTeamSequence: careTeamSequence,
            informationSequence: informationSequence,
            serviceCode: serviceCode,
            serviceDisplay: serviceDisplay,
            servicedDate: servicedDate,
            locationCode: locationCode,
            locationDisplay: locationDisplay,
            unitPrice: unitPrice,
            currency: currency,
            netValue: netValue,
            totalValue: totalValue);
    return claimDataModel;
  }

  getPatientByFhirId({required String fhirId}) async {
    const baseUrl =
        'https://server.fire.ly'; // Replace with your desired FHIR server URL
    final endpoint = '$baseUrl/Patient/$fhirId';

    try {
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        // Successfully retrieved patient record
        return response.body;
      } else {
        // Handle other status codes (e.g., 404 for not found)
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      // Handle exceptions (e.g., network errors)
      return 'Error: $e';
    }
  }

  Future<List<CarePlanModel>> getCarePlanList(
      {required String patientID}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/CarePlan.json?orderBy="patientId"&equalTo="$patientID"');
    try {
      final response = await http.get(url);
      warningLog('get care Plan list ${response.statusCode}');
      final responseBody = json.decode(response.body) as Map;
      responseBody.forEach((key, value) {
        localCarePlanModels.add(CarePlanModel.fromMap(value));
      });
      return localCarePlanModels;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MedicationAdministrationModel>> getMedicationAdministrationList(
      {required String patientID}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/MedicationAdministration.json?orderBy="patientId"&equalTo="$patientID"');
    try {
      final response = await http.get(url);
      warningLog('get medicationAdministration ${response.statusCode}');
      final responseBody = json.decode(response.body) as Map;
      responseBody.forEach((key, value) {
        localMedicationAdministrationModel
            .add(MedicationAdministrationModel.fromMap(value));
      });
      return localMedicationAdministrationModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AppointmentModel>> getAppointmentModelList(
      {required String patientId}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/Appointment.json?orderBy="patientId"&equalTo="$patientId"');
    try {
      final response = await http.get(url);
      warningLog(
          'appointment Model ${response.statusCode} and body ${response.body}');
      final responseBody = json.decode(response.body) as Map;
      responseBody.forEach((key, value) {
        localAppointmentModels.add(
          AppointmentModel.fromMap(value),
        );
      });
      return localAppointmentModels;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MedicationRequestModel>> getMedicationList(
      {required String patientID}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/MedicationRequest.json?orderBy="patientId"&equalTo="$patientID"');
    try {
      final response = await http.get(url);
      warningLog('Get Medication List ${response.statusCode}');
      final responseBody = json.decode(response.body) as Map;
      responseBody.forEach((key, value) {
        localMedicationRequestModel.add(
          MedicationRequestModel.fromMap(value),
        );
      });
      return localMedicationRequestModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ObservationModel>> getObservationList(
      {required String patientId}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/Observation.json?orderBy="existingPatientId"&equalTo="$patientId"');
    try {
      final response = await http.get(url);
      warningLog('get observation list ${response.statusCode}');
      final responseBody = json.decode(response.body) as Map;
      responseBody.forEach((key, value) {
        localObservationModel.add(
          ObservationModel.fromMap(value),
        );
      });
      return localObservationModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DiagnosticReportModel>> getDiagonisticReportList(
      {required String patientID}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/DiagonisticReport.json?orderBy="patientId"&equalTo="$patientID"');
    try {
      final response = await http.get(url);
      warningLog(
          'get diagnosticReport list ${response.statusCode} and also body ${response.body}');
      final responseBody = json.decode(response.body) as Map;
      responseBody.forEach((key, value) {
        localDiagnosticReportModel.add(
          DiagnosticReportModel.fromMap(value),
        );
      });
      warningLog('Diagnostic Report Model $localDiagnosticReportModel');
      return localDiagnosticReportModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ClaimDataModel>> getClaimList({required String patientID}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/Claim.json?orderBy="patientId"&equalTo="$patientID"');
    try {
      final response = await http.get(url);
      warningLog('get claim list ${response.statusCode}');
      final responseBody = json.decode(response.body) as Map;
      responseBody.forEach((key, value) {
        localClaimModel.add(
          ClaimDataModel.fromMap(value),
        );
      });
      return localClaimModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FhirPatientModel>> getPatientList() async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/FhirPatient.json');
    try {
      final response = await http.get(url);
      warningLog('Get patient List ${response.statusCode}');
      final responseBody = json.decode(response.body) as Map;
      // warningLog('Get patient list $responseBody');
      responseBody.forEach((key, value) {
        fhirPatientModel.add(
          FhirPatientModel.fromMap(value),
        );
      });
      warningLog('patient models $fhirPatientModel');
      return fhirPatientModel;
    } catch (e) {
      rethrow;
    }
  }
}
