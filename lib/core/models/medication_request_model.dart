// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MedicationRequestModel extends Equatable {
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
  String medicationRequestFhirID;
  String medicationRequestSource;
  MedicationRequestModel({
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
    required this.medicationRequestFhirID,
    required this.medicationRequestSource,
  });

  MedicationRequestModel copyWith({
    String? medicationRequestId,
    String? medicationId,
    String? medicationCode,
    String? medicationDisplay,
    String? medicineCode,
    String? medicineName,
    String? identifier,
    String? status,
    String? intent,
    String? categoryCode,
    String? categoryDisplay,
    String? patientId,
    String? patientName,
    String? encounterId,
    String? encounterDisplay,
    String? supportingInfoProcedure,
    String? authoredOnDate,
    String? practitionerName,
    String? practitionerId,
    String? reasonCode,
    String? reasonDisplay,
    String? notes,
    String? dosageInstruction,
    String? dosageInstructionCode,
    String? additionalDosageInstructionText,
    int? frequency,
    int? period,
    String? periodUnit,
    String? when,
    String? routeCode,
    String? routeMessage,
    String? methodText,
    String? methodCode,
    String? doseRateTypeCode,
    String? doseRateTypeDisplay,
    int? doseRangeLowValue,
    String? doseRangeLowUnit,
    String? doseRangeLowCode,
    int? doseRangeHighValue,
    String? doseRangeHighUnit,
    String? doseRangeHighCode,
    String? dispenseRequestStartDate,
    String? dispenseRequestEndDate,
    String? dispenseRequestNumberOfRequests,
    int? dispenseRequestQuantityValue,
    String? dispenseRequestQuantityUnit,
    String? dispenseRequestQuantityCode,
    int? expectedSupplyDurationValue,
    String? expectedSupplyDurationUnit,
    String? expectedSupplyDurationCode,
    bool? substitutionAllowed,
    String? substitutionAllowedCode,
    String? substitutionAllowedDisplay,
    String? medicationRequestFhirID,
    String? medicationRequestSource,
  }) {
    return MedicationRequestModel(
      medicationRequestId: medicationRequestId ?? this.medicationRequestId,
      medicationId: medicationId ?? this.medicationId,
      medicationCode: medicationCode ?? this.medicationCode,
      medicationDisplay: medicationDisplay ?? this.medicationDisplay,
      medicineCode: medicineCode ?? this.medicineCode,
      medicineName: medicineName ?? this.medicineName,
      identifier: identifier ?? this.identifier,
      status: status ?? this.status,
      intent: intent ?? this.intent,
      categoryCode: categoryCode ?? this.categoryCode,
      categoryDisplay: categoryDisplay ?? this.categoryDisplay,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      encounterId: encounterId ?? this.encounterId,
      encounterDisplay: encounterDisplay ?? this.encounterDisplay,
      supportingInfoProcedure:
          supportingInfoProcedure ?? this.supportingInfoProcedure,
      authoredOnDate: authoredOnDate ?? this.authoredOnDate,
      practitionerName: practitionerName ?? this.practitionerName,
      practitionerId: practitionerId ?? this.practitionerId,
      reasonCode: reasonCode ?? this.reasonCode,
      reasonDisplay: reasonDisplay ?? this.reasonDisplay,
      notes: notes ?? this.notes,
      dosageInstruction: dosageInstruction ?? this.dosageInstruction,
      dosageInstructionCode:
          dosageInstructionCode ?? this.dosageInstructionCode,
      additionalDosageInstructionText: additionalDosageInstructionText ??
          this.additionalDosageInstructionText,
      frequency: frequency ?? this.frequency,
      period: period ?? this.period,
      periodUnit: periodUnit ?? this.periodUnit,
      when: when ?? this.when,
      routeCode: routeCode ?? this.routeCode,
      routeMessage: routeMessage ?? this.routeMessage,
      methodText: methodText ?? this.methodText,
      methodCode: methodCode ?? this.methodCode,
      doseRateTypeCode: doseRateTypeCode ?? this.doseRateTypeCode,
      doseRateTypeDisplay: doseRateTypeDisplay ?? this.doseRateTypeDisplay,
      doseRangeLowValue: doseRangeLowValue ?? this.doseRangeLowValue,
      doseRangeLowUnit: doseRangeLowUnit ?? this.doseRangeLowUnit,
      doseRangeLowCode: doseRangeLowCode ?? this.doseRangeLowCode,
      doseRangeHighValue: doseRangeHighValue ?? this.doseRangeHighValue,
      doseRangeHighUnit: doseRangeHighUnit ?? this.doseRangeHighUnit,
      doseRangeHighCode: doseRangeHighCode ?? this.doseRangeHighCode,
      dispenseRequestStartDate:
          dispenseRequestStartDate ?? this.dispenseRequestStartDate,
      dispenseRequestEndDate:
          dispenseRequestEndDate ?? this.dispenseRequestEndDate,
      dispenseRequestNumberOfRequests: dispenseRequestNumberOfRequests ??
          this.dispenseRequestNumberOfRequests,
      dispenseRequestQuantityValue:
          dispenseRequestQuantityValue ?? this.dispenseRequestQuantityValue,
      dispenseRequestQuantityUnit:
          dispenseRequestQuantityUnit ?? this.dispenseRequestQuantityUnit,
      dispenseRequestQuantityCode:
          dispenseRequestQuantityCode ?? this.dispenseRequestQuantityCode,
      expectedSupplyDurationValue:
          expectedSupplyDurationValue ?? this.expectedSupplyDurationValue,
      expectedSupplyDurationUnit:
          expectedSupplyDurationUnit ?? this.expectedSupplyDurationUnit,
      expectedSupplyDurationCode:
          expectedSupplyDurationCode ?? this.expectedSupplyDurationCode,
      substitutionAllowed: substitutionAllowed ?? this.substitutionAllowed,
      substitutionAllowedCode:
          substitutionAllowedCode ?? this.substitutionAllowedCode,
      substitutionAllowedDisplay:
          substitutionAllowedDisplay ?? this.substitutionAllowedDisplay,
      medicationRequestFhirID:
          medicationRequestFhirID ?? this.medicationRequestFhirID,
      medicationRequestSource:
          medicationRequestSource ?? this.medicationRequestSource,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicationRequestId': medicationRequestId,
      'medicationId': medicationId,
      'medicationCode': medicationCode,
      'medicationDisplay': medicationDisplay,
      'medicineCode': medicineCode,
      'medicineName': medicineName,
      'identifier': identifier,
      'status': status,
      'intent': intent,
      'categoryCode': categoryCode,
      'categoryDisplay': categoryDisplay,
      'patientId': patientId,
      'patientName': patientName,
      'encounterId': encounterId,
      'encounterDisplay': encounterDisplay,
      'supportingInfoProcedure': supportingInfoProcedure,
      'authoredOnDate': authoredOnDate,
      'practitionerName': practitionerName,
      'practitionerId': practitionerId,
      'reasonCode': reasonCode,
      'reasonDisplay': reasonDisplay,
      'notes': notes,
      'dosageInstruction': dosageInstruction,
      'dosageInstructionCode': dosageInstructionCode,
      'additionalDosageInstructionText': additionalDosageInstructionText,
      'frequency': frequency,
      'period': period,
      'periodUnit': periodUnit,
      'when': when,
      'routeCode': routeCode,
      'routeMessage': routeMessage,
      'methodText': methodText,
      'methodCode': methodCode,
      'doseRateTypeCode': doseRateTypeCode,
      'doseRateTypeDisplay': doseRateTypeDisplay,
      'doseRangeLowValue': doseRangeLowValue,
      'doseRangeLowUnit': doseRangeLowUnit,
      'doseRangeLowCode': doseRangeLowCode,
      'doseRangeHighValue': doseRangeHighValue,
      'doseRangeHighUnit': doseRangeHighUnit,
      'doseRangeHighCode': doseRangeHighCode,
      'dispenseRequestStartDate': dispenseRequestStartDate,
      'dispenseRequestEndDate': dispenseRequestEndDate,
      'dispenseRequestNumberOfRequests': dispenseRequestNumberOfRequests,
      'dispenseRequestQuantityValue': dispenseRequestQuantityValue,
      'dispenseRequestQuantityUnit': dispenseRequestQuantityUnit,
      'dispenseRequestQuantityCode': dispenseRequestQuantityCode,
      'expectedSupplyDurationValue': expectedSupplyDurationValue,
      'expectedSupplyDurationUnit': expectedSupplyDurationUnit,
      'expectedSupplyDurationCode': expectedSupplyDurationCode,
      'substitutionAllowed': substitutionAllowed,
      'substitutionAllowedCode': substitutionAllowedCode,
      'substitutionAllowedDisplay': substitutionAllowedDisplay,
      'medicationRequestFhirID': medicationRequestFhirID,
      'medicationRequestSource': medicationRequestSource,
    };
  }

  factory MedicationRequestModel.fromMap(Map<String, dynamic> map) {
    return MedicationRequestModel(
      medicationRequestId: map['medicationRequestId'] as String,
      medicationId: map['medicationId'] as String,
      medicationCode: map['medicationCode'] as String,
      medicationDisplay: map['medicationDisplay'] as String,
      medicineCode: map['medicineCode'] as String,
      medicineName: map['medicineName'] as String,
      identifier:
          map['identifier'] != null ? map['identifier'] as String : null,
      status: map['status'] as String,
      intent: map['intent'] != null ? map['intent'] as String : null,
      categoryCode:
          map['categoryCode'] != null ? map['categoryCode'] as String : null,
      categoryDisplay: map['categoryDisplay'] != null
          ? map['categoryDisplay'] as String
          : null,
      patientId: map['patientId'] != null ? map['patientId'] as String : null,
      patientName:
          map['patientName'] != null ? map['patientName'] as String : null,
      encounterId:
          map['encounterId'] != null ? map['encounterId'] as String : null,
      encounterDisplay: map['encounterDisplay'] != null
          ? map['encounterDisplay'] as String
          : null,
      supportingInfoProcedure: map['supportingInfoProcedure'] != null
          ? map['supportingInfoProcedure'] as String
          : null,
      authoredOnDate: map['authoredOnDate'] != null
          ? map['authoredOnDate'] as String
          : null,
      practitionerName: map['practitionerName'] != null
          ? map['practitionerName'] as String
          : null,
      practitionerId: map['practitionerId'] != null
          ? map['practitionerId'] as String
          : null,
      reasonCode:
          map['reasonCode'] != null ? map['reasonCode'] as String : null,
      reasonDisplay:
          map['reasonDisplay'] != null ? map['reasonDisplay'] as String : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      dosageInstruction: map['dosageInstruction'] != null
          ? map['dosageInstruction'] as String
          : null,
      dosageInstructionCode: map['dosageInstructionCode'] != null
          ? map['dosageInstructionCode'] as String
          : null,
      additionalDosageInstructionText:
          map['additionalDosageInstructionText'] != null
              ? map['additionalDosageInstructionText'] as String
              : null,
      frequency: map['frequency'] != null ? map['frequency'] as int : null,
      period: map['period'] != null ? map['period'] as int : null,
      periodUnit:
          map['periodUnit'] != null ? map['periodUnit'] as String : null,
      when: map['when'] != null ? map['when'] as String : null,
      routeCode: map['routeCode'] != null ? map['routeCode'] as String : null,
      routeMessage:
          map['routeMessage'] != null ? map['routeMessage'] as String : null,
      methodText:
          map['methodText'] != null ? map['methodText'] as String : null,
      methodCode:
          map['methodCode'] != null ? map['methodCode'] as String : null,
      doseRateTypeCode: map['doseRateTypeCode'] != null
          ? map['doseRateTypeCode'] as String
          : null,
      doseRateTypeDisplay: map['doseRateTypeDisplay'] != null
          ? map['doseRateTypeDisplay'] as String
          : null,
      doseRangeLowValue: map['doseRangeLowValue'] != null
          ? map['doseRangeLowValue'] as int
          : null,
      doseRangeLowUnit: map['doseRangeLowUnit'] != null
          ? map['doseRangeLowUnit'] as String
          : null,
      doseRangeLowCode: map['doseRangeLowCode'] != null
          ? map['doseRangeLowCode'] as String
          : null,
      doseRangeHighValue: map['doseRangeHighValue'] != null
          ? map['doseRangeHighValue'] as int
          : null,
      doseRangeHighUnit: map['doseRangeHighUnit'] != null
          ? map['doseRangeHighUnit'] as String
          : null,
      doseRangeHighCode: map['doseRangeHighCode'] != null
          ? map['doseRangeHighCode'] as String
          : null,
      dispenseRequestStartDate: map['dispenseRequestStartDate'] != null
          ? map['dispenseRequestStartDate'] as String
          : null,
      dispenseRequestEndDate: map['dispenseRequestEndDate'] != null
          ? map['dispenseRequestEndDate'] as String
          : null,
      dispenseRequestNumberOfRequests:
          map['dispenseRequestNumberOfRequests'] != null
              ? map['dispenseRequestNumberOfRequests'] as String
              : null,
      dispenseRequestQuantityValue: map['dispenseRequestQuantityValue'] != null
          ? map['dispenseRequestQuantityValue'] as int
          : null,
      dispenseRequestQuantityUnit: map['dispenseRequestQuantityUnit'] != null
          ? map['dispenseRequestQuantityUnit'] as String
          : null,
      dispenseRequestQuantityCode: map['dispenseRequestQuantityCode'] != null
          ? map['dispenseRequestQuantityCode'] as String
          : null,
      expectedSupplyDurationValue: map['expectedSupplyDurationValue'] != null
          ? map['expectedSupplyDurationValue'] as int
          : null,
      expectedSupplyDurationUnit: map['expectedSupplyDurationUnit'] != null
          ? map['expectedSupplyDurationUnit'] as String
          : null,
      expectedSupplyDurationCode: map['expectedSupplyDurationCode'] != null
          ? map['expectedSupplyDurationCode'] as String
          : null,
      substitutionAllowed: map['substitutionAllowed'] != null
          ? map['substitutionAllowed'] as bool
          : null,
      substitutionAllowedCode: map['substitutionAllowedCode'] != null
          ? map['substitutionAllowedCode'] as String
          : null,
      substitutionAllowedDisplay: map['substitutionAllowedDisplay'] != null
          ? map['substitutionAllowedDisplay'] as String
          : null,
      medicationRequestFhirID: map['medicationRequestFhirID'] as String,
      medicationRequestSource: map['medicationRequestSource'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicationRequestModel.fromJson(String source) =>
      MedicationRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

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
      medicationRequestFhirID,
      medicationRequestSource,
    ];
  }
}
