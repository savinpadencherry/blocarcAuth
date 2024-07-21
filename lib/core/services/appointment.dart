import 'dart:convert';

import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/appointmentmodel.dart';
import 'package:http/http.dart' as http;

class AppointmentService with LogMixin {
  Future<AppointmentModel> sendAppointmentDetails({
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
    final url = Uri.parse('http://hapi.fhir.org/baseR4/Appointment');
    final headers = {'Content-Type': 'application/fhir+json'};
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            {
              "resourceType": "Appointment",
              "id": "example",
              "text": {
                "status": "generated",
              },
              "status": status,
              "class": [
                {
                  "coding": [
                    {
                      "system":
                          "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                      "code": actCode,
                      "display": actDisplay
                    }
                  ]
                }
              ],
              "serviceCategory": [
                {
                  "coding": [
                    {
                      "system": "http://example.org/service-category",
                      "code": serviceCategoryCode,
                      "display": serviceCategoryDisplay,
                    }
                  ]
                }
              ],
              "serviceType": [
                {
                  "concept": {
                    "coding": [
                      {
                        "code": serviceTypeCode,
                        "display": serviceTypeDisplay,
                      }
                    ]
                  }
                }
              ],
              "specialty": [
                {
                  "coding": [
                    {
                      "system": "http://snomed.info/sct",
                      "code": specialtyCode,
                      "display": specialtyDisplay,
                    }
                  ]
                }
              ],
              "appointmentType": {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/v2-0276",
                    "code": appointmentTypeCode,
                    "display": appointmentTypeDisplay,
                  }
                ]
              },
              "reason": [
                {
                  "reference": {"display": reasonDisplay}
                }
              ],
              "description": description,
              "start": startDate,
              "end": endDate,
              "created": createdDate,
              "note": [
                {
                  "text": note,
                }
              ],
              "patientInstruction": [
                {
                  "concept": {
                    "text": patientInstructionText,
                  }
                }
              ],
              "basedOn": [
                {"reference": "ServiceRequest/$serviceRequest"}
              ],
              "subject": {"display": patientName},
              "participant": [
                {
                  "actor": {"display": patientName},
                  "required": patientRequired,
                  "status": patientStatus
                },
                {
                  "type": [
                    {
                      "coding": [
                        {
                          "system":
                              "http://terminology.hl7.org/CodeSystem/v3-ParticipationType",
                          "code": type
                        }
                      ]
                    }
                  ],
                  "actor": {
                    "reference": "Practitioner/example",
                    "display": practitionerName
                  },
                  "required": practitionerRequired,
                  "status": practitionerStatus
                },
                {
                  "actor": {"display": location},
                  "required": locationRequired,
                  "status": locationStatus,
                }
              ]
            }
          },
        ),
      );
      warningLog(
          'checking for the response ${response.statusCode} and its body ${response.body}');

      final responseBody = json.decode(response.body);
      final String fhirId = responseBody['id'];
      final String source = responseBody['meta']['source'];
      warningLog('Checking for Fhir Id $fhirId and source $source');
      AppointmentModel appointmentModel = AppointmentModel(
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
          type: type);
      await createAppointmentInFb(appointmentModel: appointmentModel);
      return appointmentModel;
    } catch (e) {
      rethrow;
    }
  }

  createAppointmentInFb({required AppointmentModel appointmentModel}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/Appointment.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'actDisplay': appointmentModel.actDisplay,
            'serviceCategoryCode': appointmentModel.serviceCategoryCode,
            'serviceCategoryDisplay': appointmentModel.serviceCategoryDisplay,
            'serviceTypeCode': appointmentModel.serviceTypeCode,
            'serviceTypeDisplay': appointmentModel.serviceTypeDisplay,
            'specialtyCode': appointmentModel.specialtyCode,
            'specialtyDisplay': appointmentModel.specialtyDisplay,
            'appointmentTypeCode': appointmentModel.appointmentTypeCode,
            'appointmentTypeDisplay': appointmentModel.appointmentTypeDisplay,
            'reasonDisplay': appointmentModel.reasonDisplay,
            'description': appointmentModel.description,
            'startDate': appointmentModel.startDate,
            'endDate': appointmentModel.endDate,
            'createdDate': appointmentModel.createdDate,
            'note': appointmentModel.note,
            'patientInstructionText': appointmentModel.patientInstructionText,
            'serviceRequest': appointmentModel.serviceRequest,
            'patientName': appointmentModel.patientName,
            'patientRequired': appointmentModel.patientRequired,
            'patientStatus': appointmentModel.patientStatus,
            'practitionerStatus': appointmentModel.practitionerStatus,
            'practitionerName': appointmentModel.practitionerName,
            'practitionerRequired': appointmentModel.practitionerRequired,
            'location': appointmentModel.location,
            'locationRequired': appointmentModel.locationRequired,
            'locationStatus': appointmentModel.locationStatus,
            'type': appointmentModel.type,
            'fhirId': appointmentModel.fhirId,
            'source': appointmentModel.source,
          },
        ),
      );
      warningLog(
          'the message code ${response.statusCode} and  body ${response.body}');
      final responseBody = json.decode(response.body);
      warningLog('responseBody = $responseBody');
    } catch (e) {
      rethrow;
    }
  }
}
