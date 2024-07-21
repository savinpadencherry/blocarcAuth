// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

import 'package:fhirpat/core/logger.dart';

class ObservationModel with LogMixin {
  String existingPatientId;
  String patientName;
  String practitionerName;
  String condition;
  String status;
  String typeCode;
  String typeDisplay;
  String observationSource;
  String valueQuantity;
  String conditionId;
  String practitionerId;
  String interpretationCode;
  String interpretationDisplay;
  String observationId;
  String? methodCode;
  String? methodText;
  String observationFhirId;
  dynamic lowReferenceRangeQuantityValue;
  String lowReferenceRangeUnitValue;
  dynamic lowReferenceRangeCodeValue;
  dynamic highReferenceRangeQuantityValue;
  String highReferenceRangeUnitValue;
  dynamic highReferenceRangeCodeValue;
  ObservationModel({
    required this.existingPatientId,
    required this.patientName,
    required this.practitionerName,
    required this.condition,
    required this.status,
    required this.typeCode,
    required this.typeDisplay,
    required this.observationSource,
    required this.valueQuantity,
    required this.conditionId,
    required this.practitionerId,
    required this.interpretationCode,
    required this.interpretationDisplay,
    required this.observationId,
    this.methodCode,
    this.methodText,
    required this.observationFhirId,
    required this.lowReferenceRangeQuantityValue,
    required this.lowReferenceRangeUnitValue,
    required this.lowReferenceRangeCodeValue,
    required this.highReferenceRangeQuantityValue,
    required this.highReferenceRangeUnitValue,
    required this.highReferenceRangeCodeValue,
  });

  ObservationModel copyWith({
    String? existingPatientId,
    String? patientName,
    String? practitionerName,
    String? condition,
    String? status,
    String? typeCode,
    String? typeDisplay,
    String? observationSource,
    String? valueQuantity,
    String? conditionId,
    String? practitionerId,
    String? interpretationCode,
    String? interpretationDisplay,
    String? observationId,
    String? methodCode,
    String? methodText,
    String? observationFhirId,
    dynamic lowReferenceRangeQuantityValue,
    String? lowReferenceRangeUnitValue,
    dynamic lowReferenceRangeCodeValue,
    dynamic highReferenceRangeQuantityValue,
    String? highReferenceRangeUnitValue,
    dynamic highReferenceRangeCodeValue,
  }) {
    return ObservationModel(
      existingPatientId: existingPatientId ?? this.existingPatientId,
      patientName: patientName ?? this.patientName,
      practitionerName: practitionerName ?? this.practitionerName,
      condition: condition ?? this.condition,
      status: status ?? this.status,
      typeCode: typeCode ?? this.typeCode,
      typeDisplay: typeDisplay ?? this.typeDisplay,
      observationSource: observationSource ?? this.observationSource,
      valueQuantity: valueQuantity ?? this.valueQuantity,
      conditionId: conditionId ?? this.conditionId,
      practitionerId: practitionerId ?? this.practitionerId,
      interpretationCode: interpretationCode ?? this.interpretationCode,
      interpretationDisplay:
          interpretationDisplay ?? this.interpretationDisplay,
      observationId: observationId ?? this.observationId,
      methodCode: methodCode ?? this.methodCode,
      methodText: methodText ?? this.methodText,
      observationFhirId: observationFhirId ?? this.observationFhirId,
      lowReferenceRangeQuantityValue:
          lowReferenceRangeQuantityValue ?? this.lowReferenceRangeQuantityValue,
      lowReferenceRangeUnitValue:
          lowReferenceRangeUnitValue ?? this.lowReferenceRangeUnitValue,
      lowReferenceRangeCodeValue:
          lowReferenceRangeCodeValue ?? this.lowReferenceRangeCodeValue,
      highReferenceRangeQuantityValue: highReferenceRangeQuantityValue ??
          this.highReferenceRangeQuantityValue,
      highReferenceRangeUnitValue:
          highReferenceRangeUnitValue ?? this.highReferenceRangeUnitValue,
      highReferenceRangeCodeValue:
          highReferenceRangeCodeValue ?? this.highReferenceRangeCodeValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'existingPatientId': existingPatientId,
      'patientName': patientName,
      'practitionerName': practitionerName,
      'condition': condition,
      'status': status,
      'typeCode': typeCode,
      'typeDisplay': typeDisplay,
      'observationSource': observationSource,
      'valueQuantity': valueQuantity,
      'conditionId': conditionId,
      'practitionerId': practitionerId,
      'interpretationCode': interpretationCode,
      'interpretationDisplay': interpretationDisplay,
      'observationId': observationId,
      'methodCode': methodCode,
      'methodText': methodText,
      'observationFhirId': observationFhirId,
      'lowReferenceRangeQuantityValue': lowReferenceRangeQuantityValue,
      'lowReferenceRangeUnitValue': lowReferenceRangeUnitValue,
      'lowReferenceRangeCodeValue': lowReferenceRangeCodeValue,
      'highReferenceRangeQuantityValue': highReferenceRangeQuantityValue,
      'highReferenceRangeUnitValue': highReferenceRangeUnitValue,
      'highReferenceRangeCodeValue': highReferenceRangeCodeValue,
    };
  }

  factory ObservationModel.fromMap(Map<String, dynamic> map) {
    return ObservationModel(
      existingPatientId: map['existingPatientId'] as String,
      patientName: map['patientName'] as String,
      practitionerName: map['practitionerName'] as String,
      condition: map['condition'] as String,
      status: map['status'] as String,
      typeCode: map['typeCode'] as String,
      typeDisplay: map['typeDisplay'] as String,
      observationSource: map['observationSource'] as String,
      valueQuantity: map['valueQuantity'] as String,
      conditionId: map['conditionId'] as String,
      practitionerId: map['practitionerId'] as String,
      interpretationCode: map['interpretationCode'] as String,
      interpretationDisplay: map['interpretationDisplay'] as String,
      observationId: map['observationId'] as String,
      methodCode:
          map['methodCode'] != null ? map['methodCode'] as String : null,
      methodText:
          map['methodText'] != null ? map['methodText'] as String : null,
      observationFhirId: map['observationFhirId'] as String,
      lowReferenceRangeQuantityValue:
          map['lowReferenceRangeQuantityValue'] as dynamic,
      lowReferenceRangeUnitValue: map['lowReferenceRangeUnitValue'] as String,
      lowReferenceRangeCodeValue: map['lowReferenceRangeCodeValue'] as dynamic,
      highReferenceRangeQuantityValue:
          map['highReferenceRangeQuantityValue'] as dynamic,
      highReferenceRangeUnitValue: map['highReferenceRangeUnitValue'] as String,
      highReferenceRangeCodeValue:
          map['highReferenceRangeCodeValue'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ObservationModel.fromJson(String source) =>
      ObservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ObservationModel(existingPatientId: $existingPatientId, patientName: $patientName, practitionerName: $practitionerName, condition: $condition, status: $status, typeCode: $typeCode, typeDisplay: $typeDisplay, observationSource: $observationSource, valueQuantity: $valueQuantity, conditionId: $conditionId, practitionerId: $practitionerId, interpretationCode: $interpretationCode, interpretationDisplay: $interpretationDisplay, observationId: $observationId, methodCode: $methodCode, methodText: $methodText, observationFhirId: $observationFhirId, lowReferenceRangeQuantityValue: $lowReferenceRangeQuantityValue, lowReferenceRangeUnitValue: $lowReferenceRangeUnitValue, lowReferenceRangeCodeValue: $lowReferenceRangeCodeValue, highReferenceRangeQuantityValue: $highReferenceRangeQuantityValue, highReferenceRangeUnitValue: $highReferenceRangeUnitValue, highReferenceRangeCodeValue: $highReferenceRangeCodeValue)';
  }

  List<Object?> get props {
    return [
      existingPatientId,
      patientName,
      practitionerName,
      condition,
      status,
      typeCode,
      typeDisplay,
      valueQuantity,
      interpretationCode,
      interpretationDisplay,
      conditionId,
      practitionerId,
      valueQuantity,
      interpretationCode,
      interpretationDisplay,
      methodCode,
      methodText,
      observationFhirId,
      observationSource,
      observationId,
      lowReferenceRangeQuantityValue,
      lowReferenceRangeUnitValue,
      lowReferenceRangeCodeValue,
      highReferenceRangeQuantityValue,
      highReferenceRangeUnitValue,
      highReferenceRangeCodeValue,
    ];
  }
}
