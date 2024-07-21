// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ClaimDataModel extends Equatable {
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
  String? fhirId;
  String? source;
  ClaimDataModel({
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
    this.fhirId,
    this.source,
  });

  ClaimDataModel copyWith({
    String? claimID,
    String? patientId,
    String? patientFamilyName,
    String? patientName,
    String? patientGender,
    String? patientDOB,
    String? patientPhoneNumber,
    String? patientEmail,
    String? patientAddress,
    String? patientCity,
    String? patientLineAddress,
    String? patientCityAddress,
    String? patientStateAdress,
    String? patientCountryAdress,
    String? patientPostalCode,
    String? coverageId,
    String? coverageIdentifierValue,
    String? coverageStatus,
    String? coverageValue,
    String? coverageKind,
    String? coverageTypeCode,
    String? coverageTypeDisplay,
    String? relationshipCode,
    String? startDate,
    String? endDate,
    String? insurerId,
    String? insurerDisplay,
    String? classCode,
    String? classValue,
    String? use,
    String? typeCode,
    String? subTypeCode,
    String? subTypeName,
    String? status,
    String? organizationId,
    String? priorityCode,
    String? payeeCode,
    String? practitionerName,
    String? patientStatusCode,
    String? diagnosisCode,
    String? diagnosisDisplay,
    String? insuranceFocal,
    String? insuranceId,
    String? careTeamSequence,
    String? informationSequence,
    String? serviceCode,
    String? serviceDisplay,
    String? servicedDate,
    String? locationCode,
    String? locationDisplay,
    double? unitPrice,
    String? currency,
    double? netValue,
    double? totalValue,
    String? fhirId,
    String? source,
  }) {
    return ClaimDataModel(
      claimID: claimID ?? this.claimID,
      patientId: patientId ?? this.patientId,
      patientFamilyName: patientFamilyName ?? this.patientFamilyName,
      patientName: patientName ?? this.patientName,
      patientGender: patientGender ?? this.patientGender,
      patientDOB: patientDOB ?? this.patientDOB,
      patientPhoneNumber: patientPhoneNumber ?? this.patientPhoneNumber,
      patientEmail: patientEmail ?? this.patientEmail,
      patientAddress: patientAddress ?? this.patientAddress,
      patientCity: patientCity ?? this.patientCity,
      patientLineAddress: patientLineAddress ?? this.patientLineAddress,
      patientCityAddress: patientCityAddress ?? this.patientCityAddress,
      patientStateAdress: patientStateAdress ?? this.patientStateAdress,
      patientCountryAdress: patientCountryAdress ?? this.patientCountryAdress,
      patientPostalCode: patientPostalCode ?? this.patientPostalCode,
      coverageId: coverageId ?? this.coverageId,
      coverageIdentifierValue:
          coverageIdentifierValue ?? this.coverageIdentifierValue,
      coverageStatus: coverageStatus ?? this.coverageStatus,
      coverageValue: coverageValue ?? this.coverageValue,
      coverageKind: coverageKind ?? this.coverageKind,
      coverageTypeCode: coverageTypeCode ?? this.coverageTypeCode,
      coverageTypeDisplay: coverageTypeDisplay ?? this.coverageTypeDisplay,
      relationshipCode: relationshipCode ?? this.relationshipCode,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      insurerId: insurerId ?? this.insurerId,
      insurerDisplay: insurerDisplay ?? this.insurerDisplay,
      classCode: classCode ?? this.classCode,
      classValue: classValue ?? this.classValue,
      use: use ?? this.use,
      typeCode: typeCode ?? this.typeCode,
      subTypeCode: subTypeCode ?? this.subTypeCode,
      subTypeName: subTypeName ?? this.subTypeName,
      status: status ?? this.status,
      organizationId: organizationId ?? this.organizationId,
      priorityCode: priorityCode ?? this.priorityCode,
      payeeCode: payeeCode ?? this.payeeCode,
      practitionerName: practitionerName ?? this.practitionerName,
      patientStatusCode: patientStatusCode ?? this.patientStatusCode,
      diagnosisCode: diagnosisCode ?? this.diagnosisCode,
      diagnosisDisplay: diagnosisDisplay ?? this.diagnosisDisplay,
      insuranceFocal: insuranceFocal ?? this.insuranceFocal,
      insuranceId: insuranceId ?? this.insuranceId,
      careTeamSequence: careTeamSequence ?? this.careTeamSequence,
      informationSequence: informationSequence ?? this.informationSequence,
      serviceCode: serviceCode ?? this.serviceCode,
      serviceDisplay: serviceDisplay ?? this.serviceDisplay,
      servicedDate: servicedDate ?? this.servicedDate,
      locationCode: locationCode ?? this.locationCode,
      locationDisplay: locationDisplay ?? this.locationDisplay,
      unitPrice: unitPrice ?? this.unitPrice,
      currency: currency ?? this.currency,
      netValue: netValue ?? this.netValue,
      totalValue: totalValue ?? this.totalValue,
      fhirId: fhirId ?? this.fhirId,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'claimID': claimID,
      'patientId': patientId,
      'patientFamilyName': patientFamilyName,
      'patientName': patientName,
      'patientGender': patientGender,
      'patientDOB': patientDOB,
      'patientPhoneNumber': patientPhoneNumber,
      'patientEmail': patientEmail,
      'patientAddress': patientAddress,
      'patientCity': patientCity,
      'patientLineAddress': patientLineAddress,
      'patientCityAddress': patientCityAddress,
      'patientStateAdress': patientStateAdress,
      'patientCountryAdress': patientCountryAdress,
      'patientPostalCode': patientPostalCode,
      'coverageId': coverageId,
      'coverageIdentifierValue': coverageIdentifierValue,
      'coverageStatus': coverageStatus,
      'coverageValue': coverageValue,
      'coverageKind': coverageKind,
      'coverageTypeCode': coverageTypeCode,
      'coverageTypeDisplay': coverageTypeDisplay,
      'relationshipCode': relationshipCode,
      'startDate': startDate,
      'endDate': endDate,
      'insurerId': insurerId,
      'insurerDisplay': insurerDisplay,
      'classCode': classCode,
      'classValue': classValue,
      'use': use,
      'typeCode': typeCode,
      'subTypeCode': subTypeCode,
      'subTypeName': subTypeName,
      'status': status,
      'organizationId': organizationId,
      'priorityCode': priorityCode,
      'payeeCode': payeeCode,
      'practitionerName': practitionerName,
      'patientStatusCode': patientStatusCode,
      'diagnosisCode': diagnosisCode,
      'diagnosisDisplay': diagnosisDisplay,
      'insuranceFocal': insuranceFocal,
      'insuranceId': insuranceId,
      'careTeamSequence': careTeamSequence,
      'informationSequence': informationSequence,
      'serviceCode': serviceCode,
      'serviceDisplay': serviceDisplay,
      'servicedDate': servicedDate,
      'locationCode': locationCode,
      'locationDisplay': locationDisplay,
      'unitPrice': unitPrice,
      'currency': currency,
      'netValue': netValue,
      'totalValue': totalValue,
      'fhirId': fhirId,
      'source': source,
    };
  }

  factory ClaimDataModel.fromMap(Map<String, dynamic> map) {
    return ClaimDataModel(
      claimID: map['claimID'] as String,
      patientId: map['patientId'] as String,
      patientFamilyName: map['patientFamilyName'] as String,
      patientName: map['patientName'] as String,
      patientGender: map['patientGender'] as String,
      patientDOB: map['patientDOB'] as String,
      patientPhoneNumber: map['patientPhoneNumber'] as String,
      patientEmail: map['patientEmail'] as String,
      patientAddress: map['patientAddress'] as String,
      patientCity: map['patientCity'] as String,
      patientLineAddress: map['patientLineAddress'] as String,
      patientCityAddress: map['patientCityAddress'] as String,
      patientStateAdress: map['patientStateAdress'] as String,
      patientCountryAdress: map['patientCountryAdress'] as String,
      patientPostalCode: map['patientPostalCode'] as String,
      coverageId: map['coverageId'] as String,
      coverageIdentifierValue: map['coverageIdentifierValue'] as String,
      coverageStatus: map['coverageStatus'] as String,
      coverageValue: map['coverageValue'] as String,
      coverageKind: map['coverageKind'] as String,
      coverageTypeCode: map['coverageTypeCode'] as String,
      coverageTypeDisplay: map['coverageTypeDisplay'] as String,
      relationshipCode: map['relationshipCode'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      insurerId: map['insurerId'] as String,
      insurerDisplay: map['insurerDisplay'] as String,
      classCode: map['classCode'] as String,
      classValue: map['classValue'] as String,
      use: map['use'] as String,
      typeCode: map['typeCode'] as String,
      subTypeCode: map['subTypeCode'] as String,
      subTypeName: map['subTypeName'] as String,
      status: map['status'] as String,
      organizationId: map['organizationId'] as String,
      priorityCode: map['priorityCode'] as String,
      payeeCode: map['payeeCode'] as String,
      practitionerName: map['practitionerName'] as String,
      patientStatusCode: map['patientStatusCode'] as String,
      diagnosisCode: map['diagnosisCode'] as String,
      diagnosisDisplay: map['diagnosisDisplay'] as String,
      insuranceFocal: map['insuranceFocal'] as String,
      insuranceId: map['insuranceId'] as String,
      careTeamSequence: map['careTeamSequence'] as String,
      informationSequence: map['informationSequence'] as String,
      serviceCode: map['serviceCode'] as String,
      serviceDisplay: map['serviceDisplay'] as String,
      servicedDate: map['servicedDate'] as String,
      locationCode: map['locationCode'] as String,
      locationDisplay: map['locationDisplay'] as String,
      unitPrice: map['unitPrice'] as double,
      currency: map['currency'] as String,
      netValue: map['netValue'] as double,
      totalValue: map['totalValue'] as double,
      fhirId: map['fhirId'] != null ? map['fhirId'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClaimDataModel.fromJson(String source) =>
      ClaimDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

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
      fhirId,
      source,
    ];
  }
}
