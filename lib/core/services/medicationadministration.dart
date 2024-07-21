import 'dart:convert';

import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/medication_administration_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MedicationAdministrationService with LogMixin {
  createMedicationAdministrationInHapi({
    required String medicationAdministrationId,
    required String medicationId,
    required String medicineCode,
    required String medicineName,
    required String status,
    required String medicationReferenceRequestId,
    required String patientName,
    required String patientId,
    required String encounterId,
    required String encounterDisplay,
    required String occurenceStartPeriod,
    required String occurenceEndPeriod,
    required String practitionerId,
    required String practitionerName,
    required String dosageText,
    required String routeCode,
    required String routeName,
    required int doseValue,
    required String doseUnit,
    required String doseCode,
    required int rateRatioValue,
    required String rateRatioCode,
    required int denominatorValue,
    required String denominatorCode,
  }) async {
    final url =
        Uri.parse('http://hapi.fhir.org/baseR4/MedicationAdministration');
    final headers = {'Content-Type': 'application/fhir+json'};
    DateTime parsedOccurenceStartDate =
        DateFormat("dd/MM/yyyy").parse(occurenceStartPeriod);
    String parsedformattedStartDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").format(parsedOccurenceStartDate);
    DateTime parsedOccurenceEndDate =
        DateFormat("dd/MM/yyyy").parse(occurenceEndPeriod);
    String parsedformattedEndDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").format(parsedOccurenceEndDate);
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "resourceType": "MedicationAdministration",
            "id": medicationAdministrationId,
            "text": {"status": "generated"},
            "contained": [
              {
                "resourceType": "Medication",
                "id": medicationId,
                "code": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/sid/ndc",
                      "code": medicineCode,
                      "display": medicineName,
                    }
                  ]
                }
              }
            ],
            "status": status,
            "medication": {
              "reference": {"reference": medicationReferenceRequestId}
            },
            "subject": {
              "reference": "Patient/$patientId",
              "display": patientName,
            },
            "encounter": {
              "reference": "Encounter/$encounterId",
              "display": encounterDisplay
            },
            "occurencePeriod": {
              "start": parsedformattedStartDate,
              "end": parsedformattedEndDate,
            },
            "performer": [
              {
                "actor": {
                  "reference": {
                    "reference": "Practitioner/$practitionerId",
                    "display": practitionerName
                  }
                }
              }
            ],
            "request": {
              "reference": "MedicationRequest/$medicationReferenceRequestId"
            },
            "dosage": {
              "text": dosageText,
              "route": {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": routeCode,
                    "display": routeName,
                  }
                ]
              },
              "dose": {
                "value": doseValue,
                "unit": doseUnit,
                "system": "http://unitsofmeasure.org",
                "code": doseCode,
              },
              "rateRatio": {
                "numerator": {
                  "value": rateRatioValue,
                  "system": "http://unitsofmeasure.org",
                  "code": rateRatioCode,
                },
                "denominator": {
                  "value": denominatorValue,
                  "system": "http://unitsofmeasure.org",
                  "code": denominatorCode,
                }
              }
            }
          },
        ),
      );
      warningLog(
          'checking for the response ${response.statusCode} and its body ${response.body}');

      final responseBody = json.decode(response.body);
      final String medicationAdministrationFhirID = responseBody['id'];
      final String source = responseBody['meta']['source'];
      warningLog(
          'Checking for Fhir Id $medicationAdministrationFhirID and source $source');
      MedicationAdministrationModel medicationAdministrationModel =
          MedicationAdministrationModel(
        medicationAdministrationId: medicationAdministrationId,
        medicationId: medicationId,
        medicineCode: medicineCode,
        medicineName: medicineName,
        status: status,
        medicationReferenceRequestId: medicationReferenceRequestId,
        patientName: patientName,
        patientId: patientId,
        encounterId: encounterId,
        encounterDisplay: encounterDisplay,
        occurenceStartPeriod: occurenceStartPeriod,
        occurenceEndPeriod: occurenceEndPeriod,
        practitionerId: practitionerId,
        practitionerName: practitionerName,
        dosageText: dosageText,
        routeCode: routeCode,
        routeName: routeName,
        doseValue: doseValue,
        doseUnit: doseUnit,
        doseCode: doseCode,
        rateRatioValue: rateRatioValue,
        rateRatioCode: rateRatioCode,
        denominatorValue: denominatorValue,
        denominatorCode: denominatorCode,
        medicationAdministrationFhirID: medicationAdministrationFhirID,
        source: source,
      );
      await createMedicationAdministrationResourceInFB(
          medicationAdministrationModel: medicationAdministrationModel);
      return medicationAdministrationModel;
    } catch (e) {
      rethrow;
    }
  }

  createMedicationAdministrationResourceInFB(
      {required MedicationAdministrationModel
          medicationAdministrationModel}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/MedicationAdministration.json');

    try {
      final response = await http.post(
        url,
        body: json.encode({
          "medicationAdministrationId":
              medicationAdministrationModel.medicationAdministrationId,
          "medicationId": medicationAdministrationModel.medicationId,
          "medicineCode": medicationAdministrationModel.medicineCode,
          "medicineName": medicationAdministrationModel.medicineName,
          "status": medicationAdministrationModel.status,
          "medicationReferenceRequestId":
              medicationAdministrationModel.medicationReferenceRequestId,
          "patientName": medicationAdministrationModel.patientName,
          "patientId": medicationAdministrationModel.patientId,
          "encounterId": medicationAdministrationModel.encounterId,
          "encounterDisplay": medicationAdministrationModel.encounterDisplay,
          "occurenceStartPeriod":
              medicationAdministrationModel.occurenceStartPeriod,
          "occurenceEndPeriod":
              medicationAdministrationModel.occurenceEndPeriod,
          "practitionerId": medicationAdministrationModel.practitionerId,
          "practitionerName": medicationAdministrationModel.practitionerName,
          "dosageText": medicationAdministrationModel.dosageText,
          "routeCode": medicationAdministrationModel.routeCode,
          "routeName": medicationAdministrationModel.routeName,
          "doseValue": medicationAdministrationModel.doseValue,
          "doseUnit": medicationAdministrationModel.doseUnit,
          "doseCode": medicationAdministrationModel.doseCode,
          "rateRatioValue": medicationAdministrationModel.rateRatioValue,
          "rateRatioCode": medicationAdministrationModel.rateRatioCode,
          "denominatorValue": medicationAdministrationModel.denominatorValue,
          "denominatorCode": medicationAdministrationModel.denominatorCode,
        }),
      );
      warningLog(
          'response statusCode ${response.statusCode}, ${response.body}');
      final responseBody = json.decode(response.body);
      warningLog('$responseBody');
    } catch (e) {
      rethrow;
    }
  }
}
