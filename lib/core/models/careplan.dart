// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fhirpat/core/logger.dart';

class CarePlanModel with LogMixin {
  String carePlanID;
  String identifier;
  String careFhirID;
  String careSource;
  String status;
  String intent;
  String patientId;
  String patientName;
  String startPeriod;
  String endPeriod;
  String practitionerId;
  String practitionerName;
  String conditionID;
  String conditionName;
  String lifeCycleStatus;
  String achievementStatus;
  String achievementStatusCode;
  String occurenceDate;
  String descrption;
  String note;
  String activityPlannedReference;
  String activityStatus;
  String activityIntent;
  String activityCode;
  String carePlanStatus;
  String carePlanIntent;
  String acitivityDisplay;
  CarePlanModel({
    required this.carePlanID,
    required this.identifier,
    required this.careFhirID,
    required this.careSource,
    required this.status,
    required this.intent,
    required this.patientId,
    required this.patientName,
    required this.startPeriod,
    required this.endPeriod,
    required this.practitionerId,
    required this.practitionerName,
    required this.conditionID,
    required this.conditionName,
    required this.lifeCycleStatus,
    required this.achievementStatus,
    required this.achievementStatusCode,
    required this.occurenceDate,
    required this.descrption,
    required this.note,
    required this.activityPlannedReference,
    required this.activityStatus,
    required this.activityIntent,
    required this.activityCode,
    required this.carePlanStatus,
    required this.carePlanIntent,
    required this.acitivityDisplay,
  });

  CarePlanModel copyWith({
    String? carePlanID,
    String? identifier,
    String? careFhirID,
    String? careSource,
    String? status,
    String? intent,
    String? patientId,
    String? patientName,
    String? startPeriod,
    String? endPeriod,
    String? practitionerId,
    String? practitionerName,
    String? conditionID,
    String? conditionName,
    String? lifeCycleStatus,
    String? achievementStatus,
    String? achievementStatusCode,
    String? occurenceDate,
    String? descrption,
    String? note,
    String? activityPlannedReference,
    String? activityStatus,
    String? activityIntent,
    String? activityCode,
    String? carePlanStatus,
    String? carePlanIntent,
    String? acitivityDisplay,
  }) {
    return CarePlanModel(
      carePlanID: carePlanID ?? this.carePlanID,
      identifier: identifier ?? this.identifier,
      careFhirID: careFhirID ?? this.careFhirID,
      careSource: careSource ?? this.careSource,
      status: status ?? this.status,
      intent: intent ?? this.intent,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      practitionerId: practitionerId ?? this.practitionerId,
      practitionerName: practitionerName ?? this.practitionerName,
      conditionID: conditionID ?? this.conditionID,
      conditionName: conditionName ?? this.conditionName,
      lifeCycleStatus: lifeCycleStatus ?? this.lifeCycleStatus,
      achievementStatus: achievementStatus ?? this.achievementStatus,
      achievementStatusCode:
          achievementStatusCode ?? this.achievementStatusCode,
      occurenceDate: occurenceDate ?? this.occurenceDate,
      descrption: descrption ?? this.descrption,
      note: note ?? this.note,
      activityPlannedReference:
          activityPlannedReference ?? this.activityPlannedReference,
      activityStatus: activityStatus ?? this.activityStatus,
      activityIntent: activityIntent ?? this.activityIntent,
      activityCode: activityCode ?? this.activityCode,
      carePlanStatus: carePlanStatus ?? this.carePlanStatus,
      carePlanIntent: carePlanIntent ?? this.carePlanIntent,
      acitivityDisplay: acitivityDisplay ?? this.acitivityDisplay,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carePlanID': carePlanID,
      'identifier': identifier,
      'careFhirID': careFhirID,
      'careSource': careSource,
      'status': status,
      'intent': intent,
      'patientId': patientId,
      'patientName': patientName,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'practitionerId': practitionerId,
      'practitionerName': practitionerName,
      'conditionID': conditionID,
      'conditionName': conditionName,
      'lifeCycleStatus': lifeCycleStatus,
      'achievementStatus': achievementStatus,
      'achievementStatusCode': achievementStatusCode,
      'occurenceDate': occurenceDate,
      'descrption': descrption,
      'note': note,
      'activityPlannedReference': activityPlannedReference,
      'activityStatus': activityStatus,
      'activityIntent': activityIntent,
      'activityCode': activityCode,
      'carePlanStatus': carePlanStatus,
      'carePlanIntent': carePlanIntent,
      'acitivityDisplay': acitivityDisplay,
    };
  }

  factory CarePlanModel.fromMap(Map<String, dynamic> map) {
    return CarePlanModel(
      carePlanID: map['carePlanID'] as String,
      identifier: map['identifier'] as String,
      careFhirID: map['careFhirID'] as String,
      careSource: map['careSource'] as String,
      status: map['status'] as String,
      intent: map['intent'] as String,
      patientId: map['patientId'] as String,
      patientName: map['patientName'] as String,
      startPeriod: map['startPeriod'] as String,
      endPeriod: map['endPeriod'] as String,
      practitionerId: map['practitionerId'] as String,
      practitionerName: map['practitionerName'] as String,
      conditionID: map['conditionID'] as String,
      conditionName: map['conditionName'] as String,
      lifeCycleStatus: map['lifeCycleStatus'] as String,
      achievementStatus: map['achievementStatus'] as String,
      achievementStatusCode: map['achievementStatusCode'] as String,
      occurenceDate: map['occurenceDate'] as String,
      descrption: map['descrption'] as String,
      note: map['note'] as String,
      activityPlannedReference: map['activityPlannedReference'] as String,
      activityStatus: map['activityStatus'] as String,
      activityIntent: map['activityIntent'] as String,
      activityCode: map['activityCode'] as String,
      carePlanStatus: map['carePlanStatus'] as String,
      carePlanIntent: map['carePlanIntent'] as String,
      acitivityDisplay: map['acitivityDisplay'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarePlanModel.fromJson(String source) =>
      CarePlanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarePlanModel(carePlanID: $carePlanID, identifier: $identifier, careFhirID: $careFhirID, careSource: $careSource, status: $status, intent: $intent, patientId: $patientId, patientName: $patientName, startPeriod: $startPeriod, endPeriod: $endPeriod, practitionerId: $practitionerId, practitionerName: $practitionerName, conditionID: $conditionID, conditionName: $conditionName, lifeCycleStatus: $lifeCycleStatus, achievementStatus: $achievementStatus, achievementStatusCode: $achievementStatusCode, occurenceDate: $occurenceDate, descrption: $descrption, note: $note, activityPlannedReference: $activityPlannedReference, activityStatus: $activityStatus, activityIntent: $activityIntent, activityCode: $activityCode, carePlanStatus: $carePlanStatus, carePlanIntent: $carePlanIntent, acitivityDisplay: $acitivityDisplay)';
  }

  List<Object?> get props {
    return [
      carePlanID,
      identifier,
      status,
      intent,
      patientId,
      patientName,
      endPeriod,
      startPeriod,
      practitionerId,
      practitionerName,
      conditionID,
      conditionName,
      occurenceDate,
      lifeCycleStatus,
      achievementStatus,
      achievementStatusCode,
      descrption,
      note,
      activityPlannedReference,
      activityStatus,
      activityIntent,
      carePlanStatus,
      carePlanIntent,
      activityCode,
      acitivityDisplay,
      careFhirID,
      careSource,
    ];
  }
}
