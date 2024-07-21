// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'fhirpat_bloc.dart';

class FhirpatEvent extends Equatable {
  const FhirpatEvent();

  @override
  List<Object?> get props => [];
}

class FhirpatPatientEvent extends FhirpatEvent {
  String patientId;
  String patientNam;
  String patientFamilyName;
  String patientPhone;
  String patientGender;
  String patientAddressLine;
  String patientAddressCity;
  String patientAddressPostCode;
  String patientAddressCountry;
  String patientRelation;
  String patientRelationFamilyName;
  String patientRelationPhone;
  String patientRelationAddress;
  String patientRelationGender;
  String patientCommunication;
  String patientGeneralPractitioner;
  String patientManagingOrganization;
  String patientLink;
  String patientSuffix;
  String patientEmail;
  File xfile;
  String patientDoB;
  String countryCode;
  String patientManagingOrganizationCode;
  bool deceased;
  FhirpatPatientEvent(
      {required this.patientId,
      required this.patientNam,
      required this.patientFamilyName,
      required this.patientPhone,
      required this.patientGender,
      required this.patientAddressLine,
      required this.patientAddressCity,
      required this.patientAddressPostCode,
      required this.patientAddressCountry,
      required this.patientRelation,
      required this.patientRelationFamilyName,
      required this.patientRelationPhone,
      required this.patientRelationAddress,
      required this.patientRelationGender,
      required this.patientCommunication,
      required this.patientGeneralPractitioner,
      required this.patientManagingOrganization,
      required this.patientLink,
      required this.patientSuffix,
      required this.patientEmail,
      required this.patientDoB,
      required this.countryCode,
      required this.patientManagingOrganizationCode,
      required this.deceased,
      required this.xfile});
  @override
  List<Object> get props => [
        patientId,
        patientAddressCity,
        patientAddressCountry,
        patientAddressLine,
        patientAddressPostCode,
        patientCommunication,
        patientDoB,
        patientEmail,
        patientFamilyName,
        patientGender,
        patientGeneralPractitioner,
        patientLink,
        patientManagingOrganization,
        patientManagingOrganizationCode,
        patientNam,
        patientPhone,
        patientRelation,
        patientRelationAddress,
        patientRelationFamilyName,
        patientRelationGender,
        patientRelationPhone,
        patientSuffix,
        xfile
      ];
}

class FhirPatCreateObservationEvent extends FhirpatEvent {
  String existingPatientId;
  String patientName;
  String practitionerName;
  String condition;
  String status;
  String typeCode;
  String typeDisplay;
  String valueQuantity;
  String identifier;
  String conditionId;
  String observationId;
  String practitionerId;
  String valueUnit;
  String valueCode;
  String interpretationCode;
  String interpretationDisplay;
  String? methodCode;
  String? methodText;
  dynamic lowReferenceRangeQuantityValue;
  String lowReferenceRangeUnitValue;
  dynamic lowReferenceRangeCodeValue;
  dynamic highReferenceRangeQuantityValue;
  String highReferenceRangeUnitValue;
  dynamic highReferenceRangeCodeValue;
  FhirPatCreateObservationEvent({
    required this.existingPatientId,
    required this.patientName,
    required this.practitionerName,
    required this.condition,
    required this.status,
    required this.typeCode,
    required this.typeDisplay,
    required this.valueQuantity,
    required this.identifier,
    required this.conditionId,
    required this.observationId,
    required this.practitionerId,
    required this.valueCode,
    required this.valueUnit,
    required this.interpretationCode,
    required this.interpretationDisplay,
    this.methodCode,
    this.methodText,
    required this.lowReferenceRangeQuantityValue,
    required this.lowReferenceRangeUnitValue,
    required this.lowReferenceRangeCodeValue,
    required this.highReferenceRangeQuantityValue,
    required this.highReferenceRangeUnitValue,
    required this.highReferenceRangeCodeValue,
  });
  @override
  List<Object?> get props => [
        existingPatientId,
        patientName,
        practitionerName,
        condition,
        status,
        typeCode,
        typeDisplay,
        valueQuantity,
        identifier,
        observationId,
        conditionId,
        practitionerId,
        valueUnit,
        valueCode,
        interpretationCode,
        interpretationDisplay,
        methodCode,
        methodText,
        lowReferenceRangeQuantityValue,
        lowReferenceRangeUnitValue,
        lowReferenceRangeCodeValue,
        highReferenceRangeQuantityValue,
        highReferenceRangeUnitValue,
        highReferenceRangeCodeValue,
      ];
}

class FhirCreateCarePlanEvent extends FhirpatEvent {
  final String carePlanID;
  final String identifier;
  final String status;
  final String intent;
  final String patientId;
  final String patientName;
  final String startPeriod;
  final String endPeriod;
  final String occurenceDate;
  final String practitionerId;
  final String practitionerName;
  final String conditionID;
  final String conditionName;
  final String lifeCycleStatus;
  final String achievementStatus;
  final String achievementStatusCode;
  final String description;
  final String note;
  final String activityPlannedReference;
  final String activityStatus;
  final String activityIntent;
  final String activityCode;
  final String activityDisplay;
  final String carePlanStatus;
  final String carePlanIntent;

  const FhirCreateCarePlanEvent({
    required this.carePlanID,
    required this.identifier,
    required this.status,
    required this.intent,
    required this.patientId,
    required this.patientName,
    required this.startPeriod,
    required this.endPeriod,
    required this.occurenceDate,
    required this.practitionerId,
    required this.practitionerName,
    required this.conditionID,
    required this.conditionName,
    required this.lifeCycleStatus,
    required this.achievementStatus,
    required this.achievementStatusCode,
    required this.description,
    required this.note,
    required this.activityPlannedReference,
    required this.activityStatus,
    required this.activityIntent,
    required this.activityCode,
    required this.activityDisplay,
    required this.carePlanStatus,
    required this.carePlanIntent,
  });

  @override
  List<Object?> get props => [
        carePlanID,
        identifier,
        status,
        intent,
        patientId,
        patientName,
        startPeriod,
        endPeriod,
        practitionerId,
        practitionerName,
        occurenceDate,
        conditionID,
        conditionName,
        lifeCycleStatus,
        achievementStatus,
        description,
        note,
        achievementStatus,
        achievementStatusCode,
        description,
        note,
        activityPlannedReference,
        achievementStatus,
        activityIntent,
        activityCode,
        activityDisplay,
        carePlanStatus,
        carePlanIntent,
      ];
}

class FhirPatCreateMedicationRequestEvent extends FhirpatEvent {
  String medicationRequestId;
  String medicationId;
  String medicationCode;
  String medicationDisplay;
  String medicineCode;
  String medicineName;
  String? identifier;
  String status;
  String? intent;
  String? categoryCode;
  String? categoryDisplay;
  String? patientId;
  String? patientName;
  String? encounterId;
  String? encounterDisplay;
  String? supportingInfoProcedure;
  String? authoredOnDate;
  String? practitionerName;
  String? practitionerId;
  String? reasonCode;
  String? reasonDisplay;
  String? notes;
  String? dosageInstruction;
  String? dosageInstructionCode;
  String? additionalDosageInstructionText;
  int? frequency;
  int? period;
  String? periodUnit;
  String? when;
  String? routeCode;
  String? routeMessage;
  String? methodText;
  String? methodCode;
  String? doseRateTypeCode;
  String? doseRateTypeDisplay;
  int? doseRangeLowValue;
  String? doseRangeLowUnit;
  String? doseRangeLowCode;
  int? doseRangeHighValue;
  String? doseRangeHighUnit;
  String? doseRangeHighCode;
  String? dispenseRequestStartDate;
  String? dispenseRequestEndDate;
  String? dispenseRequestNumberOfRequests;
  int? dispenseRequestQuantityValue;
  String? dispenseRequestQuantityUnit;
  String? dispenseRequestQuantityCode;
  int? expectedSupplyDurationValue;
  String? expectedSupplyDurationUnit;
  String? expectedSupplyDurationCode;
  bool? substitutionAllowed;
  String? substitutionAllowedCode;
  String? substitutionAllowedDisplay;
  FhirPatCreateMedicationRequestEvent({
    required this.medicationRequestId,
    required this.medicationId,
    required this.medicationCode,
    required this.medicationDisplay,
    required this.medicineCode,
    required this.medicineName,
    this.identifier,
    required this.status,
    this.intent,
    this.categoryCode,
    this.categoryDisplay,
    this.patientId,
    this.patientName,
    this.encounterId,
    this.encounterDisplay,
    this.supportingInfoProcedure,
    this.authoredOnDate,
    this.practitionerName,
    this.practitionerId,
    this.reasonCode,
    this.reasonDisplay,
    this.notes,
    this.dosageInstruction,
    this.dosageInstructionCode,
    this.additionalDosageInstructionText,
    this.frequency,
    this.period,
    this.periodUnit,
    this.when,
    this.routeCode,
    this.routeMessage,
    this.methodText,
    this.methodCode,
    this.doseRateTypeCode,
    this.doseRateTypeDisplay,
    this.doseRangeLowValue,
    this.doseRangeLowUnit,
    this.doseRangeLowCode,
    this.doseRangeHighValue,
    this.doseRangeHighUnit,
    this.doseRangeHighCode,
    this.dispenseRequestStartDate,
    this.dispenseRequestEndDate,
    this.dispenseRequestNumberOfRequests,
    this.dispenseRequestQuantityValue,
    this.dispenseRequestQuantityUnit,
    this.dispenseRequestQuantityCode,
    this.expectedSupplyDurationValue,
    this.expectedSupplyDurationUnit,
    this.expectedSupplyDurationCode,
    this.substitutionAllowed,
    this.substitutionAllowedCode,
    this.substitutionAllowedDisplay,
  });
  @override
  List<Object?> get props {
    return [
      medicationRequestId,
      medicationId,
      medicationCode,
      medicationDisplay,
      medicineCode,
      medicineName,
      identifier,
      status,
      intent,
      categoryCode,
      categoryDisplay,
      patientId,
      patientName,
      encounterId,
      encounterDisplay,
      supportingInfoProcedure,
      authoredOnDate,
      practitionerName,
      practitionerId,
      reasonCode,
      reasonDisplay,
      notes,
      dosageInstruction,
      dosageInstructionCode,
      additionalDosageInstructionText,
      frequency,
      period,
      periodUnit,
      when,
      routeCode,
      routeMessage,
      methodText,
      methodCode,
      doseRateTypeCode,
      doseRateTypeDisplay,
      doseRangeLowValue,
      doseRangeLowUnit,
      doseRangeLowCode,
      doseRangeHighValue,
      doseRangeHighUnit,
      doseRangeHighCode,
      dispenseRequestStartDate,
      dispenseRequestEndDate,
      dispenseRequestNumberOfRequests,
      dispenseRequestQuantityValue,
      dispenseRequestQuantityUnit,
      dispenseRequestQuantityCode,
      expectedSupplyDurationValue,
      expectedSupplyDurationUnit,
      expectedSupplyDurationCode,
      substitutionAllowed,
      substitutionAllowedCode,
      substitutionAllowedDisplay,
    ];
  }
}

class FhirCreateMedicationAdministrationEvent extends FhirpatEvent {
  String medicationAdministrationId;
  String medicationId;
  String medicineCode;
  String medicineName;
  String status;
  String medicationReferenceRequestId;
  String patientName;
  String patientId;
  String encounterId;
  String encounterDisplay;
  String occurenceStartPeriod;
  String occurenceEndPeriod;
  String practitionerId;
  String practitionerName;
  String dosageText;
  String routeCode;
  String routeName;
  int doseValue;
  String doseUnit;
  String doseCode;
  int rateRatioValue;
  String rateRatioCode;
  int denominatorValue;
  String denominatorCode;
  FhirCreateMedicationAdministrationEvent({
    required this.medicationAdministrationId,
    required this.medicationId,
    required this.medicineCode,
    required this.medicineName,
    required this.status,
    required this.medicationReferenceRequestId,
    required this.patientName,
    required this.patientId,
    required this.encounterId,
    required this.encounterDisplay,
    required this.occurenceStartPeriod,
    required this.occurenceEndPeriod,
    required this.practitionerId,
    required this.practitionerName,
    required this.dosageText,
    required this.routeCode,
    required this.routeName,
    required this.doseValue,
    required this.doseUnit,
    required this.doseCode,
    required this.rateRatioValue,
    required this.rateRatioCode,
    required this.denominatorValue,
    required this.denominatorCode,
  });
  @override
  List<Object?> get props => [
        medicationAdministrationId,
        medicationId,
        medicineCode,
        medicineName,
        status,
        medicationReferenceRequestId,
        patientName,
        patientId,
        encounterId,
        encounterDisplay,
        occurenceStartPeriod,
        occurenceEndPeriod,
        practitionerId,
        practitionerName,
        dosageText,
        routeCode,
        routeName,
        doseValue,
        doseUnit,
        doseCode,
        rateRatioValue,
        rateRatioCode,
        denominatorValue,
        denominatorCode,
      ];
}

class FhirCreateDiagnosticReportEvent extends FhirpatEvent {
  String diagonisticReportId;
  String diagonisticReportStudyType;
  String diagonisticReportStudyId;
  String diagonisticReportStatus;
  String patientId;
  String description;
  String categoryCode;
  String categoryDisplay;
  String status;
  String typeOfDiagnosticTestCode;
  String typeOfDiagnosticTestDisplay;
  String patientName;
  String organizationId;
  String organizationName;
  String conclusion;
  String conclusionCode;
  String conclusionDisplay;
  String effectiveDateTime;
  String issued;
  FhirCreateDiagnosticReportEvent({
    required this.diagonisticReportId,
    required this.diagonisticReportStudyType,
    required this.diagonisticReportStudyId,
    required this.diagonisticReportStatus,
    required this.patientId,
    required this.description,
    required this.categoryCode,
    required this.categoryDisplay,
    required this.status,
    required this.typeOfDiagnosticTestCode,
    required this.typeOfDiagnosticTestDisplay,
    required this.patientName,
    required this.organizationId,
    required this.organizationName,
    required this.conclusion,
    required this.conclusionCode,
    required this.conclusionDisplay,
    required this.effectiveDateTime,
    required this.issued,
  });
  @override
  List<Object?> get props {
    return [
      diagonisticReportId,
      diagonisticReportStudyType,
      diagonisticReportStudyId,
      diagonisticReportStatus,
      patientId,
      description,
      categoryCode,
      categoryDisplay,
      status,
      typeOfDiagnosticTestCode,
      typeOfDiagnosticTestDisplay,
      patientName,
      organizationId,
      organizationName,
      conclusion,
      conclusionCode,
      conclusionDisplay,
      effectiveDateTime,
      issued,
    ];
  }
}

class FhirCreateAppointmentEvent extends FhirpatEvent {
  String status;
  String actCode;
  String actDisplay;
  String serviceCategoryCode;
  String serviceCategoryDisplay;
  String serviceTypeCode;
  String serviceTypeDisplay;
  String specialtyCode;
  String specialtyDisplay;
  String appointmentTypeCode;
  String appointmentTypeDisplay;
  String reasonDisplay;
  String description;
  String startDate;
  String endDate;
  String createdDate;
  String note;
  String patientInstructionText;
  String serviceRequest;
  String patientName;
  String patientRequired;
  String patientStatus;
  String practitionerStatus;
  String practitionerName;
  String practitionerRequired;
  String location;
  String locationRequired;
  String locationStatus;
  String type;
  FhirCreateAppointmentEvent({
    required this.status,
    required this.actCode,
    required this.actDisplay,
    required this.serviceCategoryCode,
    required this.serviceCategoryDisplay,
    required this.serviceTypeCode,
    required this.serviceTypeDisplay,
    required this.specialtyCode,
    required this.specialtyDisplay,
    required this.appointmentTypeCode,
    required this.appointmentTypeDisplay,
    required this.reasonDisplay,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.createdDate,
    required this.note,
    required this.patientInstructionText,
    required this.serviceRequest,
    required this.patientName,
    required this.patientRequired,
    required this.patientStatus,
    required this.practitionerStatus,
    required this.practitionerName,
    required this.practitionerRequired,
    required this.location,
    required this.locationRequired,
    required this.locationStatus,
    required this.type,
  });
  @override
  List<Object?> get props {
    return [
      status,
      actCode,
      actDisplay,
      serviceCategoryCode,
      serviceCategoryDisplay,
      serviceTypeCode,
      serviceTypeDisplay,
      specialtyCode,
      specialtyDisplay,
      appointmentTypeCode,
      appointmentTypeDisplay,
      reasonDisplay,
      description,
      startDate,
      endDate,
      createdDate,
      note,
      patientInstructionText,
      serviceRequest,
      patientName,
      patientRequired,
      patientStatus,
      practitionerStatus,
      practitionerName,
      practitionerRequired,
      location,
      locationRequired,
      locationStatus,
      type,
    ];
  }
}

class FhirCreateClaimEvent extends FhirpatEvent {
  String claimID;
  String patientId;
  String patientFamilyName;
  String patientName;
  String patientGender;
  String patientDOB;
  String patientPhoneNumber;
  String patientEmail;
  String patientAddress;
  String patientCity;
  String patientLineAddress;
  String patientCityAddress;
  String patientStateAdress;
  String patientCountryAdress;
  String patientPostalCode;
  String coverageId;
  String coverageIdentifierValue;
  String coverageStatus;
  String coverageValue;
  String coverageKind;
  String coverageTypeCode;
  String coverageTypeDisplay;
  String relationshipCode;
  String startDate;
  String endDate;
  String insurerId;
  String insurerDisplay;
  String classCode;
  String classValue;
  String use;
  String typeCode;
  String subTypeCode;
  String subTypeName;
  String status;
  String organizationId;
  String priorityCode;
  String payeeCode;
  String practitionerName;
  String patientStatusCode;
  String diagnosisCode;
  String diagnosisDisplay;
  String insuranceFocal;
  String insuranceId;
  String careTeamSequence;
  String informationSequence;
  String serviceCode;
  String serviceDisplay;
  String servicedDate;
  String locationCode;
  String locationDisplay;
  double unitPrice;
  String currency;
  double netValue;
  double totalValue;
  FhirCreateClaimEvent({
    required this.claimID,
    required this.patientId,
    required this.patientFamilyName,
    required this.patientName,
    required this.patientGender,
    required this.patientDOB,
    required this.patientPhoneNumber,
    required this.patientEmail,
    required this.patientAddress,
    required this.patientCity,
    required this.patientLineAddress,
    required this.patientCityAddress,
    required this.patientStateAdress,
    required this.patientCountryAdress,
    required this.patientPostalCode,
    required this.coverageId,
    required this.coverageIdentifierValue,
    required this.coverageStatus,
    required this.coverageValue,
    required this.coverageKind,
    required this.coverageTypeCode,
    required this.coverageTypeDisplay,
    required this.relationshipCode,
    required this.startDate,
    required this.endDate,
    required this.insurerId,
    required this.insurerDisplay,
    required this.classCode,
    required this.classValue,
    required this.use,
    required this.typeCode,
    required this.subTypeCode,
    required this.subTypeName,
    required this.status,
    required this.organizationId,
    required this.priorityCode,
    required this.payeeCode,
    required this.practitionerName,
    required this.patientStatusCode,
    required this.diagnosisCode,
    required this.diagnosisDisplay,
    required this.insuranceFocal,
    required this.insuranceId,
    required this.careTeamSequence,
    required this.informationSequence,
    required this.serviceCode,
    required this.serviceDisplay,
    required this.servicedDate,
    required this.locationCode,
    required this.locationDisplay,
    required this.unitPrice,
    required this.currency,
    required this.netValue,
    required this.totalValue,
  });
  @override
  List<Object?> get props {
    return [
      claimID,
      patientId,
      patientFamilyName,
      patientName,
      patientGender,
      patientDOB,
      patientPhoneNumber,
      patientEmail,
      patientAddress,
      patientCity,
      patientLineAddress,
      patientCityAddress,
      patientStateAdress,
      patientCountryAdress,
      patientPostalCode,
      coverageId,
      coverageIdentifierValue,
      coverageStatus,
      coverageValue,
      coverageKind,
      coverageTypeCode,
      coverageTypeDisplay,
      relationshipCode,
      startDate,
      endDate,
      insurerId,
      insurerDisplay,
      classCode,
      classValue,
      use,
      typeCode,
      subTypeCode,
      subTypeName,
      status,
      organizationId,
      priorityCode,
      payeeCode,
      practitionerName,
      patientStatusCode,
      diagnosisCode,
      diagnosisDisplay,
      insuranceFocal,
      insuranceId,
      careTeamSequence,
      informationSequence,
      serviceCode,
      serviceDisplay,
      servicedDate,
      locationCode,
      locationDisplay,
      unitPrice,
      currency,
      netValue,
      totalValue,
    ];
  }
}
