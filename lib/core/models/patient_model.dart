// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class FhirPatientModel extends Equatable {
  String patientId;
  String? patientFhirId;
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
  String patientDoB;
  String countryCode;
  String patientManagingOrganizationCode;
  String? photoUrl;
  String? source;
  bool deceased;
  FhirPatientModel({
    required this.patientId,
    this.patientFhirId,
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
    this.photoUrl,
    this.source,
    required this.deceased,
  });

  FhirPatientModel copyWith({
    String? patientId,
    String? patientFhirId,
    String? patientNam,
    String? patientFamilyName,
    String? patientPhone,
    String? patientGender,
    String? patientAddressLine,
    String? patientAddressCity,
    String? patientAddressPostCode,
    String? patientAddressCountry,
    String? patientRelation,
    String? patientRelationFamilyName,
    String? patientRelationPhone,
    String? patientRelationAddress,
    String? patientRelationGender,
    String? patientCommunication,
    String? patientGeneralPractitioner,
    String? patientManagingOrganization,
    String? patientLink,
    String? patientSuffix,
    String? patientEmail,
    String? patientDoB,
    String? countryCode,
    String? patientManagingOrganizationCode,
    String? photoUrl,
    String? source,
    bool? deceased,
  }) {
    return FhirPatientModel(
      patientId: patientId ?? this.patientId,
      patientFhirId: patientFhirId ?? this.patientFhirId,
      patientNam: patientNam ?? this.patientNam,
      patientFamilyName: patientFamilyName ?? this.patientFamilyName,
      patientPhone: patientPhone ?? this.patientPhone,
      patientGender: patientGender ?? this.patientGender,
      patientAddressLine: patientAddressLine ?? this.patientAddressLine,
      patientAddressCity: patientAddressCity ?? this.patientAddressCity,
      patientAddressPostCode:
          patientAddressPostCode ?? this.patientAddressPostCode,
      patientAddressCountry:
          patientAddressCountry ?? this.patientAddressCountry,
      patientRelation: patientRelation ?? this.patientRelation,
      patientRelationFamilyName:
          patientRelationFamilyName ?? this.patientRelationFamilyName,
      patientRelationPhone: patientRelationPhone ?? this.patientRelationPhone,
      patientRelationAddress:
          patientRelationAddress ?? this.patientRelationAddress,
      patientRelationGender:
          patientRelationGender ?? this.patientRelationGender,
      patientCommunication: patientCommunication ?? this.patientCommunication,
      patientGeneralPractitioner:
          patientGeneralPractitioner ?? this.patientGeneralPractitioner,
      patientManagingOrganization:
          patientManagingOrganization ?? this.patientManagingOrganization,
      patientLink: patientLink ?? this.patientLink,
      patientSuffix: patientSuffix ?? this.patientSuffix,
      patientEmail: patientEmail ?? this.patientEmail,
      patientDoB: patientDoB ?? this.patientDoB,
      countryCode: countryCode ?? this.countryCode,
      patientManagingOrganizationCode: patientManagingOrganizationCode ??
          this.patientManagingOrganizationCode,
      photoUrl: photoUrl ?? this.photoUrl,
      source: source ?? this.source,
      deceased: deceased ?? this.deceased,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patientId': patientId,
      'patientFhirId': patientFhirId,
      'patientNam': patientNam,
      'patientFamilyName': patientFamilyName,
      'patientPhone': patientPhone,
      'patientGender': patientGender,
      'patientAddressLine': patientAddressLine,
      'patientAddressCity': patientAddressCity,
      'patientAddressPostCode': patientAddressPostCode,
      'patientAddressCountry': patientAddressCountry,
      'patientRelation': patientRelation,
      'patientRelationFamilyName': patientRelationFamilyName,
      'patientRelationPhone': patientRelationPhone,
      'patientRelationAddress': patientRelationAddress,
      'patientRelationGender': patientRelationGender,
      'patientCommunication': patientCommunication,
      'patientGeneralPractitioner': patientGeneralPractitioner,
      'patientManagingOrganization': patientManagingOrganization,
      'patientLink': patientLink,
      'patientSuffix': patientSuffix,
      'patientEmail': patientEmail,
      'patientDoB': patientDoB,
      'countryCode': countryCode,
      'patientManagingOrganizationCode': patientManagingOrganizationCode,
      'photoUrl': photoUrl,
      'source': source,
      'deceased': deceased,
    };
  }

  factory FhirPatientModel.fromMap(Map<String, dynamic> map) {
    return FhirPatientModel(
      patientId: map['patientId'] != null ? map['patientId'] as String : "",
      patientFhirId:
          map['patientFhirId'] != null ? map['patientFhirId'] as String : null,
      patientNam:
          map['patientName'] != null ? map['patientName'] as String : "",
      patientFamilyName: map['patientFamilyName'] != null
          ? map['patientFamilyName'] as String
          : "",
      patientPhone:
          map['patientPhone'] != null ? map['patientPhone'] as String : "",
      patientGender:
          map['patientGender'] != null ? map['patientGender'] as String : "",
      patientAddressLine: map['patientAddressLine'] != null
          ? map['patientAddressLine'] as String
          : "",
      patientAddressCity: map['patientAddressCity'] != null
          ? map['patientAddressCity'] as String
          : "",
      patientAddressPostCode: map['patientAddressPostCode'] != null
          ? map['patientAddressPostCode'] as String
          : "",
      patientAddressCountry: map['patientAddressCountry'] != null
          ? map['patientAddressCountry'] as String
          : "",
      patientRelation: map['patientRelation'] != null
          ? map['patientRelation'] as String
          : "",
      patientRelationFamilyName: map['patientRelationFamilyName'] != null
          ? map['patientRelationFamilyName'] as String
          : "",
      patientRelationPhone: map['patientRelationPhone'] != null
          ? map['patientRelationPhone'] as String
          : "",
      patientRelationAddress: map['patientRelationAddress'] != null
          ? map['patientRelationAddress'] as String
          : "",
      patientRelationGender: map['patientRelationGender'] != null
          ? map['patientRelationGender'] as String
          : "",
      patientCommunication: map['patientCommunication'] != null
          ? map['patientCommunication'] as String
          : "",
      patientGeneralPractitioner: map['patientGeneralPractitioner'] != null
          ? map['patientGeneralPractitioner'] as String
          : "",
      patientManagingOrganization: map['patientManagingOrganization'] != null
          ? map['patientManagingOrganization'] as String
          : "",
      patientLink:
          map['patientLink'] != null ? map['patientLink'] as String : "",
      patientSuffix:
          map['patientSuffix'] != null ? map['patientSuffix'] as String : "",
      patientEmail:
          map['patientEmail'] != null ? map['patientEmail'] as String : "",
      patientDoB: map['patientDoB'] != null ? map['patientDoB'] as String : "",
      countryCode:
          map['countryCode'] != null ? map['countryCode'] as String : "",
      patientManagingOrganizationCode:
          map['patientManagingOrganizationCode'] != null
              ? map['patientManagingOrganizationCode'] as String
              : "",
      photoUrl: map['patientPhotoUrl'] != null
          ? map['patientPhotoUrl'] as String
          : null,
      source:
          map['patientSource'] != null ? map['patientSource'] as String : null,
      deceased: map['deceased'] != null ? map['deceased'] as bool : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory FhirPatientModel.fromJson(String source) =>
      FhirPatientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      patientId,
      patientFhirId,
      patientNam,
      patientFamilyName,
      patientPhone,
      patientGender,
      patientAddressLine,
      patientAddressCity,
      patientAddressPostCode,
      patientAddressCountry,
      patientRelation,
      patientRelationFamilyName,
      patientRelationPhone,
      patientRelationAddress,
      patientRelationGender,
      patientCommunication,
      patientGeneralPractitioner,
      patientManagingOrganization,
      patientLink,
      patientSuffix,
      patientEmail,
      patientDoB,
      countryCode,
      patientManagingOrganizationCode,
      photoUrl,
      source,
      deceased,
    ];
  }
}
