// ignore_for_file: public_member_api_docs ; sort_constructors_first, must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable {
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
  String? fhirId;
  String? source;
  AppointmentModel({
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
    this.fhirId,
    this.source,
  });

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'actCode': actCode,
      'actDisplay': actDisplay,
      'serviceCategoryCode': serviceCategoryCode,
      'serviceCategoryDisplay': serviceCategoryDisplay,
      'serviceTypeCode': serviceTypeCode,
      'serviceTypeDisplay': serviceTypeDisplay,
      'specialtyCode': specialtyCode,
      'specialtyDisplay': specialtyDisplay,
      'appointmentTypeCode': appointmentTypeCode,
      'appointmentTypeDisplay': appointmentTypeDisplay,
      'reasonDisplay': reasonDisplay,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'createdDate': createdDate,
      'note': note,
      'patientInstructionText': patientInstructionText,
      'serviceRequest': serviceRequest,
      'patientName': patientName,
      'patientRequired': patientRequired,
      'patientStatus': patientStatus,
      'practitionerStatus': practitionerStatus,
      'practitionerName': practitionerName,
      'practitionerRequired': practitionerRequired,
      'location': location,
      'locationRequired': locationRequired,
      'locationStatus': locationStatus,
      'type': type,
      'fhirId': fhirId,
      'source': source,
    };
  }

  AppointmentModel copyWith({
    String? status,
    String? actCode,
    String? actDisplay,
    String? serviceCategoryCode,
    String? serviceCategoryDisplay,
    String? serviceTypeCode,
    String? serviceTypeDisplay,
    String? specialtyCode,
    String? specialtyDisplay,
    String? appointmentTypeCode,
    String? appointmentTypeDisplay,
    String? reasonDisplay,
    String? description,
    String? startDate,
    String? endDate,
    String? createdDate,
    String? note,
    String? patientInstructionText,
    String? serviceRequest,
    String? patientName,
    String? patientRequired,
    String? patientStatus,
    String? practitionerStatus,
    String? practitionerName,
    String? practitionerRequired,
    String? location,
    String? locationRequired,
    String? locationStatus,
    String? type,
    String? fhirId,
    String? source,
  }) {
    return AppointmentModel(
      status: status ?? this.status,
      actCode: actCode ?? this.actCode,
      actDisplay: actDisplay ?? this.actDisplay,
      serviceCategoryCode: serviceCategoryCode ?? this.serviceCategoryCode,
      serviceCategoryDisplay:
          serviceCategoryDisplay ?? this.serviceCategoryDisplay,
      serviceTypeCode: serviceTypeCode ?? this.serviceTypeCode,
      serviceTypeDisplay: serviceTypeDisplay ?? this.serviceTypeDisplay,
      specialtyCode: specialtyCode ?? this.specialtyCode,
      specialtyDisplay: specialtyDisplay ?? this.specialtyDisplay,
      appointmentTypeCode: appointmentTypeCode ?? this.appointmentTypeCode,
      appointmentTypeDisplay:
          appointmentTypeDisplay ?? this.appointmentTypeDisplay,
      reasonDisplay: reasonDisplay ?? this.reasonDisplay,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdDate: createdDate ?? this.createdDate,
      note: note ?? this.note,
      patientInstructionText:
          patientInstructionText ?? this.patientInstructionText,
      serviceRequest: serviceRequest ?? this.serviceRequest,
      patientName: patientName ?? this.patientName,
      patientRequired: patientRequired ?? this.patientRequired,
      patientStatus: patientStatus ?? this.patientStatus,
      practitionerStatus: practitionerStatus ?? this.practitionerStatus,
      practitionerName: practitionerName ?? this.practitionerName,
      practitionerRequired: practitionerRequired ?? this.practitionerRequired,
      location: location ?? this.location,
      locationRequired: locationRequired ?? this.locationRequired,
      locationStatus: locationStatus ?? this.locationStatus,
      type: type ?? this.type,
      fhirId: fhirId ?? this.fhirId,
      source: source ?? this.source,
    );
  }

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
      fhirId,
      source,
    ];
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      status: map['status'] as String,
      actCode: map['actCode'] as String,
      actDisplay: map['actDisplay'] as String,
      serviceCategoryCode: map['serviceCategoryCode'] as String,
      serviceCategoryDisplay: map['serviceCategoryDisplay'] as String,
      serviceTypeCode: map['serviceTypeCode'] as String,
      serviceTypeDisplay: map['serviceTypeDisplay'] as String,
      specialtyCode: map['specialtyCode'] as String,
      specialtyDisplay: map['specialtyDisplay'] as String,
      appointmentTypeCode: map['appointmentTypeCode'] as String,
      appointmentTypeDisplay: map['appointmentTypeDisplay'] as String,
      reasonDisplay: map['reasonDisplay'] as String,
      description: map['description'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      createdDate: map['createdDate'] as String,
      note: map['note'] as String,
      patientInstructionText: map['patientInstructionText'] as String,
      serviceRequest: map['serviceRequest'] as String,
      patientName: map['patientName'] as String,
      patientRequired: map['patientRequired'] as String,
      patientStatus: map['patientStatus'] as String,
      practitionerStatus: map['practitionerStatus'] as String,
      practitionerName: map['practitionerName'] as String,
      practitionerRequired: map['practitionerRequired'] as String,
      location: map['location'] as String,
      locationRequired: map['locationRequired'] as String,
      locationStatus: map['locationStatus'] as String,
      type: map['type'] as String,
      fhirId: map['fhirId'] != null ? map['fhirId'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
    );
  }

  @override
  bool get stringify => true;
}
