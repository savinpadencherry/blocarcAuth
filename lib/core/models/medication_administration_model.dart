// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MedicationAdministrationModel extends Equatable {
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
  String medicationAdministrationFhirID;
  String source;
  MedicationAdministrationModel({
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
    required this.medicationAdministrationFhirID,
    required this.source,
  });

  MedicationAdministrationModel copyWith({
    String? medicationAdministrationId,
    String? medicationId,
    String? medicineCode,
    String? medicineName,
    String? status,
    String? medicationReferenceRequestId,
    String? patientName,
    String? patientId,
    String? encounterId,
    String? encounterDisplay,
    String? occurenceStartPeriod,
    String? occurenceEndPeriod,
    String? practitionerId,
    String? practitionerName,
    String? dosageText,
    String? routeCode,
    String? routeName,
    int? doseValue,
    String? doseUnit,
    String? doseCode,
    int? rateRatioValue,
    String? rateRatioCode,
    int? denominatorValue,
    String? denominatorCode,
    String? medicationAdministrationFhirID,
    String? source,
  }) {
    return MedicationAdministrationModel(
      medicationAdministrationId:
          medicationAdministrationId ?? this.medicationAdministrationId,
      medicationId: medicationId ?? this.medicationId,
      medicineCode: medicineCode ?? this.medicineCode,
      medicineName: medicineName ?? this.medicineName,
      status: status ?? this.status,
      medicationReferenceRequestId:
          medicationReferenceRequestId ?? this.medicationReferenceRequestId,
      patientName: patientName ?? this.patientName,
      patientId: patientId ?? this.patientId,
      encounterId: encounterId ?? this.encounterId,
      encounterDisplay: encounterDisplay ?? this.encounterDisplay,
      occurenceStartPeriod: occurenceStartPeriod ?? this.occurenceStartPeriod,
      occurenceEndPeriod: occurenceEndPeriod ?? this.occurenceEndPeriod,
      practitionerId: practitionerId ?? this.practitionerId,
      practitionerName: practitionerName ?? this.practitionerName,
      dosageText: dosageText ?? this.dosageText,
      routeCode: routeCode ?? this.routeCode,
      routeName: routeName ?? this.routeName,
      doseValue: doseValue ?? this.doseValue,
      doseUnit: doseUnit ?? this.doseUnit,
      doseCode: doseCode ?? this.doseCode,
      rateRatioValue: rateRatioValue ?? this.rateRatioValue,
      rateRatioCode: rateRatioCode ?? this.rateRatioCode,
      denominatorValue: denominatorValue ?? this.denominatorValue,
      denominatorCode: denominatorCode ?? this.denominatorCode,
      medicationAdministrationFhirID:
          medicationAdministrationFhirID ?? this.medicationAdministrationFhirID,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicationAdministrationId': medicationAdministrationId,
      'medicationId': medicationId,
      'medicineCode': medicineCode,
      'medicineName': medicineName,
      'status': status,
      'medicationReferenceRequestId': medicationReferenceRequestId,
      'patientName': patientName,
      'patientId': patientId,
      'encounterId': encounterId,
      'encounterDisplay': encounterDisplay,
      'occurenceStartPeriod': occurenceStartPeriod,
      'occurenceEndPeriod': occurenceEndPeriod,
      'practitionerId': practitionerId,
      'practitionerName': practitionerName,
      'dosageText': dosageText,
      'routeCode': routeCode,
      'routeName': routeName,
      'doseValue': doseValue,
      'doseUnit': doseUnit,
      'doseCode': doseCode,
      'rateRatioValue': rateRatioValue,
      'rateRatioCode': rateRatioCode,
      'denominatorValue': denominatorValue,
      'denominatorCode': denominatorCode,
      'medicationAdministrationFhirID': medicationAdministrationFhirID,
      'source': source,
    };
  }

  factory MedicationAdministrationModel.fromMap(Map<String, dynamic> map) {
    return MedicationAdministrationModel(
      medicationAdministrationId: map['medicationAdministrationId'] as String,
      medicationId: map['medicationId'] as String,
      medicineCode: map['medicineCode'] as String,
      medicineName: map['medicineName'] as String,
      status: map['status'] as String,
      medicationReferenceRequestId:
          map['medicationReferenceRequestId'] as String,
      patientName: map['patientName'] as String,
      patientId: map['patientId'] as String,
      encounterId: map['encounterId'] as String,
      encounterDisplay: map['encounterDisplay'] as String,
      occurenceStartPeriod: map['occurenceStartPeriod'] as String,
      occurenceEndPeriod: map['occurenceEndPeriod'] as String,
      practitionerId: map['practitionerId'] as String,
      practitionerName: map['practitionerName'] as String,
      dosageText: map['dosageText'] as String,
      routeCode: map['routeCode'] as String,
      routeName: map['routeName'] as String,
      doseValue: map['doseValue'] as int,
      doseUnit: map['doseUnit'] as String,
      doseCode: map['doseCode'] as String,
      rateRatioValue: map['rateRatioValue'] as int,
      rateRatioCode: map['rateRatioCode'] as String,
      denominatorValue: map['denominatorValue'] as int,
      denominatorCode: map['denominatorCode'] as String,
      medicationAdministrationFhirID:
          map['medicationAdministrationFhirID'] as String,
      source: map['source'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicationAdministrationModel.fromJson(String source) =>
      MedicationAdministrationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
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
      medicationAdministrationFhirID,
      source,
    ];
  }
}
