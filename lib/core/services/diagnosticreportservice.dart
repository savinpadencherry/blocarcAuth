// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/diagonisticreport.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DiagonisticReportService with LogMixin {
  sendDiagonisticReportToHapi({
    required String diagonisticReportId,
    required String diagonisticReportStudyType,
    required String diagonisticReportStudyId,
    required String diagonisticReportStatus,
    required String patientId,
    required String description,
    required String categoryCode,
    required String categoryDisplay,
    required String status,
    required String typeOfDiagnosticTestCode,
    required String typeOfDiagnosticTestDisplay,
    required String patientName,
    required String organizationId,
    required String organizationName,
    required String conclusion,
    required String conclusionCode,
    required String conclusionDisplay,
    required String effectiveDateTime,
    required String issued,
  }) async {
    final url =
        Uri.parse('http://hapi.fhir.org/baseR4/MedicationAdministration');
    final headers = {'Content-Type': 'application/fhir+json'};
    DateTime parsedEffectiveDateTime =
        DateFormat("dd/MM/yyyy").parse(effectiveDateTime);
    String formattedEffectiveDateTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").format(parsedEffectiveDateTime);
    DateTime parsedIssued = DateFormat("dd/MM/yyyy").parse(issued);
    String formattedIssued =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").format(parsedIssued);
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "resourceType": "DiagnosticReport",
            "id": diagonisticReportId,
            "text": {"status": "generated"},
            "contained": [
              {
                "resourceType": diagonisticReportStudyType,
                "id": diagonisticReportStudyId,
                "status": diagonisticReportStatus,
                "subject": {
                  "reference": "Patient/$patientId",
                },
                "description": description
              }
            ],
            "status": status,
            "category": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": categoryCode,
                    "display": categoryDisplay,
                  },
                ]
              }
            ],
            "code": {
              "coding": [
                {
                  "system": "http://snomed.info/sct",
                  "code": typeOfDiagnosticTestCode,
                  "display": typeOfDiagnosticTestDisplay,
                }
              ],
              "text": typeOfDiagnosticTestDisplay,
            },
            "subject": {
              "reference": "Patient/$patientId",
              "display": patientName,
            },
            "effectiveDateTime": formattedEffectiveDateTime,
            "issued": formattedIssued,
            "performer": [
              {
                "reference": "Organization/$organizationId",
                "display": organizationName,
              }
            ],
            "study": [
              {"reference": "#is1"}
            ],
            "conclusion": conclusion,
            "conclusionCode": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": conclusionCode,
                    "display": conclusionDisplay,
                  }
                ]
              }
            ]
          },
        ),
      );
      warningLog(
          '${response.statusCode} and body of the hapi diagonistic report ${response.body}');
      final responseBody = json.decode(response.body);
      final String diagonisticReportFhirId = responseBody['id'];
      final String diagonisticSource = responseBody['meta']['source'];
      DiagnosticReportModel diagnosticReportModel = DiagnosticReportModel(
        diagonisticReportId: diagonisticReportId,
        diagonisticReportStudyType: diagonisticReportStudyType,
        diagonisticReportStudyId: diagonisticReportStudyId,
        diagonisticReportStatus: diagonisticReportStatus,
        patientId: patientId,
        description: description,
        categoryCode: categoryCode,
        categoryDisplay: categoryDisplay,
        status: status,
        typeOfDiagnosticTestCode: typeOfDiagnosticTestCode,
        typeOfDiagnosticTestDisplay: typeOfDiagnosticTestDisplay,
        patientName: patientName,
        organizationId: organizationId,
        organizationName: organizationName,
        conclusion: conclusion,
        conclusionCode: conclusionCode,
        conclusionDisplay: conclusionDisplay,
        effectiveDateTime: effectiveDateTime,
        issued: issued,
        diagonisticReportFhirId: diagonisticReportFhirId,
        diagonisticSource: diagonisticSource,
      );
      await createDiagonisticReportInFb(
          diagnosticReportModel: diagnosticReportModel);
      return diagnosticReportModel;
    } catch (e) {
      rethrow;
    }
  }

  createDiagonisticReportInFb(
      {required DiagnosticReportModel diagnosticReportModel}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/DiagonisticReport.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "diagonisticReportId": diagnosticReportModel.diagonisticReportId,
            "diagonisticReportStudyType":
                diagnosticReportModel.diagonisticReportStudyType,
            "diagonisticReportStudyId":
                diagnosticReportModel.diagonisticReportStudyId,
            "diagonisticReportStatus":
                diagnosticReportModel.diagonisticReportStatus,
            "patientId": diagnosticReportModel.patientId,
            "description": diagnosticReportModel.description,
            "categoryCode": diagnosticReportModel.categoryCode,
            "categoryDisplay": diagnosticReportModel.categoryDisplay,
            "status": diagnosticReportModel.status,
            "typeOfDiagnosticTestCode":
                diagnosticReportModel.typeOfDiagnosticTestCode,
            "typeOfDiagnosticTestDisplay":
                diagnosticReportModel.typeOfDiagnosticTestDisplay,
            "patientName": diagnosticReportModel.patientName,
            "organizationId": diagnosticReportModel.organizationId,
            "organizationName": diagnosticReportModel.organizationName,
            "conclusion": diagnosticReportModel.conclusion,
            "conclusionCode": diagnosticReportModel.conclusionCode,
            "conclusionDisplay": diagnosticReportModel.conclusionDisplay,
            "effectiveDateTime": diagnosticReportModel.effectiveDateTime,
            "issued": diagnosticReportModel.issued,
            "diagonisticReportFhirId":
                diagnosticReportModel.diagonisticReportFhirId,
            "diagonisticSource": diagnosticReportModel.diagonisticSource,
          },
        ),
      );
      warningLog(
          'response statusCode diagnostic Report ${response.statusCode} and body ${response.body}');
      final responseBody = json.decode(response.body);
      warningLog('Response Body ${responseBody}');
    } catch (e) {
      rethrow;
    }
  }
}
