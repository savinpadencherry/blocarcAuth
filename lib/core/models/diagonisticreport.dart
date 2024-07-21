// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DiagnosticReportModel extends Equatable {
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
  String? diagonisticReportFhirId;
  String? diagonisticSource;
  DiagnosticReportModel({
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
    this.diagonisticReportFhirId,
    this.diagonisticSource,
  });

  DiagnosticReportModel copyWith({
    String? diagonisticReportId,
    String? diagonisticReportStudyType,
    String? diagonisticReportStudyId,
    String? diagonisticReportStatus,
    String? patientId,
    String? description,
    String? categoryCode,
    String? categoryDisplay,
    String? status,
    String? typeOfDiagnosticTestCode,
    String? typeOfDiagnosticTestDisplay,
    String? patientName,
    String? organizationId,
    String? organizationName,
    String? conclusion,
    String? conclusionCode,
    String? conclusionDisplay,
    String? effectiveDateTime,
    String? issued,
    String? diagonisticReportFhirId,
    String? diagonisticSource,
  }) {
    return DiagnosticReportModel(
      diagonisticReportId: diagonisticReportId ?? this.diagonisticReportId,
      diagonisticReportStudyType:
          diagonisticReportStudyType ?? this.diagonisticReportStudyType,
      diagonisticReportStudyId:
          diagonisticReportStudyId ?? this.diagonisticReportStudyId,
      diagonisticReportStatus:
          diagonisticReportStatus ?? this.diagonisticReportStatus,
      patientId: patientId ?? this.patientId,
      description: description ?? this.description,
      categoryCode: categoryCode ?? this.categoryCode,
      categoryDisplay: categoryDisplay ?? this.categoryDisplay,
      status: status ?? this.status,
      typeOfDiagnosticTestCode:
          typeOfDiagnosticTestCode ?? this.typeOfDiagnosticTestCode,
      typeOfDiagnosticTestDisplay:
          typeOfDiagnosticTestDisplay ?? this.typeOfDiagnosticTestDisplay,
      patientName: patientName ?? this.patientName,
      organizationId: organizationId ?? this.organizationId,
      organizationName: organizationName ?? this.organizationName,
      conclusion: conclusion ?? this.conclusion,
      conclusionCode: conclusionCode ?? this.conclusionCode,
      conclusionDisplay: conclusionDisplay ?? this.conclusionDisplay,
      effectiveDateTime: effectiveDateTime ?? this.effectiveDateTime,
      issued: issued ?? this.issued,
      diagonisticReportFhirId:
          diagonisticReportFhirId ?? this.diagonisticReportFhirId,
      diagonisticSource: diagonisticSource ?? this.diagonisticSource,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'diagonisticReportId': diagonisticReportId,
      'diagonisticReportStudyType': diagonisticReportStudyType,
      'diagonisticReportStudyId': diagonisticReportStudyId,
      'diagonisticReportStatus': diagonisticReportStatus,
      'patientId': patientId,
      'description': description,
      'categoryCode': categoryCode,
      'categoryDisplay': categoryDisplay,
      'status': status,
      'typeOfDiagnosticTestCode': typeOfDiagnosticTestCode,
      'typeOfDiagnosticTestDisplay': typeOfDiagnosticTestDisplay,
      'patientName': patientName,
      'organizationId': organizationId,
      'organizationName': organizationName,
      'conclusion': conclusion,
      'conclusionCode': conclusionCode,
      'conclusionDisplay': conclusionDisplay,
      'effectiveDateTime': effectiveDateTime,
      'issued': issued,
      'diagonisticReportFhirId': diagonisticReportFhirId,
      'diagonisticSource': diagonisticSource,
    };
  }

  factory DiagnosticReportModel.fromMap(Map<String, dynamic> map) {
    return DiagnosticReportModel(
      diagonisticReportId: map['diagonisticReportId'] as String,
      diagonisticReportStudyType: map['diagonisticReportStudyType'] as String,
      diagonisticReportStudyId: map['diagonisticReportStudyId'] as String,
      diagonisticReportStatus: map['diagonisticReportStatus'] as String,
      patientId: map['patientId'] as String,
      description: map['description'] as String,
      categoryCode: map['categoryCode'] as String,
      categoryDisplay: map['categoryDisplay'] as String,
      status: map['status'] as String,
      typeOfDiagnosticTestCode: map['typeOfDiagnosticTestCode'] as String,
      typeOfDiagnosticTestDisplay: map['typeOfDiagnosticTestDisplay'] as String,
      patientName: map['patientName'] as String,
      organizationId: map['organizationId'] as String,
      organizationName: map['organizationName'] as String,
      conclusion: map['conclusion'] as String,
      conclusionCode: map['conclusionCode'] as String,
      conclusionDisplay: map['conclusionDisplay'] as String,
      effectiveDateTime: map['effectiveDateTime'] as String,
      issued: map['issued'] as String,
      diagonisticReportFhirId: map['diagonisticReportFhirId'] != null
          ? map['diagonisticReportFhirId'] as String
          : null,
      diagonisticSource: map['diagonisticSource'] != null
          ? map['diagonisticSource'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiagnosticReportModel.fromJson(String source) =>
      DiagnosticReportModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

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
      diagonisticReportFhirId,
      diagonisticSource,
    ];
  }
}
