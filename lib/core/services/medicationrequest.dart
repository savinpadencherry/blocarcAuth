import 'dart:convert';

import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/medication_request_model.dart';
import 'package:http/http.dart' as http;

class MedicationRequestService with LogMixin {
  sendMedicationRequestToHapi({
    required String medicationRequestId,
    required String medicationId,
    required String medicationCode,
    required String medicationDisplay,
    required String medicineCode,
    required String medicineName,
    required String? identifier,
    required String status,
    required String? intent,
    required String? categoryCode,
    required String? categoryDisplay,
    required String? patientId,
    required String? patientName,
    required String? encounterId,
    required String? encounterDisplay,
    required String? supportingInfoProcedure,
    required String? authoredOnDate,
    required String? practitionerName,
    required String? practitionerId,
    required String? reasonCode,
    required String? reasonDisplay,
    required String? notes,
    required String? dosageInstruction,
    required String? dosageInstructionCode,
    required String? additionalDosageInstructionText,
    required int? frequency,
    required int? period,
    required String? periodUnit,
    required String? when,
    required String? routeCode,
    required String? routeMessage,
    required String? methodText,
    required String? methodCode,
    required String? doseRateTypeCode,
    required String? doseRateTypeDisplay,
    required int? doseRangeLowValue,
    required String? doseRangeLowUnit,
    required String? doseRangeLowCode,
    required int? doseRangeHighValue,
    required String? doseRangeHighUnit,
    required String? doseRangeHighCode,
    required String? dispenseRequestStartDate,
    required String? dispenseRequestEndDate,
    required String? dispenseRequestNumberOfRequests,
    required int? dispenseRequestQuantityValue,
    required String? dispenseRequestQuantityUnit,
    required String? dispenseRequestQuantityCode,
    required int? expectedSupplyDurationValue,
    required String? expectedSupplyDurationUnit,
    required String? expectedSupplyDurationCode,
    required bool? substitutionAllowed,
    required String? substitutionAllowedCode,
    required String? substitutionAllowedDisplay,
  }) async {
    final url = Uri.parse('http://hapi.fhir.org/baseR4/MedicationRequest');
    final headers = {'Content-Type': 'application/fhir+json'};
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "resourceType": "MedicationRequest",
            "id": medicationRequestId,
            "text": {
              "status": "generated",
            },
            "contained": [
              {
                "resourceType": "Medication",
                "id": medicationId,
                "code": {
                  "coding": [
                    {
                      "system": "http://snomed.info/sct",
                      "code": medicationCode,
                      "display": medicationDisplay,
                    }
                  ]
                }
              }
            ],
            "identifier": [
              {
                "use": "official",
                "system": "http://www.bmc.nl/portal/prescriptions",
                "value": identifier
              }
            ],
            "status": status,
            "intent": intent,
            "category": [
              {
                "coding": [
                  {
                    "system":
                        "http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location",
                    "code": categoryCode,
                    "display": categoryDisplay,
                  }
                ]
              }
            ],
            "medication": {
              "concept": {
                "coding": [
                  {
                    "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
                    "code": medicineCode,
                    "display": medicineName
                  }
                ]
              }
            },
            "subject": {
              "reference": "Patient/$patientId",
              "display": patientName
            },
            "encounter": {
              "reference": "Encounter/$encounterId",
              "display": encounterDisplay,
            },
            "supportingInformation": [
              {"reference": "Procedure/$supportingInfoProcedure"}
            ],
            "authoredOn": authoredOnDate,
            "requester": {
              "reference": "Practitioner/$practitionerId",
              "display": practitionerName,
            },
            "reason": [
              {
                "concept": {
                  "coding": [
                    {
                      "system": "http://snomed.info/sct",
                      "code": reasonCode,
                      "display": reasonDisplay
                    }
                  ]
                }
              }
            ],
            "note": [
              {
                "text": notes,
              }
            ],
            "dosageInstruction": [
              {
                "sequence": 1,
                "text": dosageInstruction,
                "additionalInstruction": [
                  {
                    "coding": [
                      {
                        "system": "http://snomed.info/sct",
                        "code": dosageInstructionCode,
                        "display": additionalDosageInstructionText,
                      }
                    ]
                  }
                ],
                "timing": {
                  "repeat": {
                    "frequency": frequency,
                    "period": period,
                    "periodUnit": periodUnit,
                    "when": ["$when"]
                  }
                },
                "route": {
                  "coding": [
                    {
                      "system": "http://snomed.info/sct",
                      "code": routeCode,
                      "display": routeMessage,
                    }
                  ]
                },
                "method": {
                  "coding": [
                    {
                      "system": "http://snomed.info/sct",
                      "code": methodCode,
                      "display": methodText
                    }
                  ]
                },
                "doseAndRate": [
                  {
                    "type": {
                      "coding": [
                        {
                          "system":
                              "http://terminology.hl7.org/CodeSystem/dose-rate-type",
                          "code": doseRateTypeCode,
                          "display": doseRateTypeDisplay
                        }
                      ]
                    },
                    "doseRange": {
                      "low": {
                        "value": doseRangeLowValue,
                        "unit": doseRangeLowUnit,
                        "system":
                            "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm",
                        "code": doseRangeLowCode
                      },
                      "high": {
                        "value": doseRangeHighValue,
                        "unit": doseRangeHighUnit,
                        "system":
                            "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm",
                        "code": doseRangeHighCode
                      }
                    }
                  }
                ]
              }
            ],
            "dispenseRequest": {
              "validityPeriod": {
                "start": dispenseRequestStartDate,
                "end": dispenseRequestEndDate
              },
              "numberOfRepeatsAllowed": dispenseRequestNumberOfRequests,
              "quantity": {
                "value": dispenseRequestQuantityValue,
                "unit": dispenseRequestQuantityUnit,
                "system":
                    "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm",
                "code": dispenseRequestQuantityCode,
              },
              "expectedSupplyDuration": {
                "value": expectedSupplyDurationValue,
                "unit": expectedSupplyDurationUnit,
                "system": "http://unitsofmeasure.org",
                "code": expectedSupplyDurationCode,
              }
            },
            "substitution": {
              "allowedBoolean": substitutionAllowed,
              "reason": {
                "coding": [
                  {
                    "system":
                        "http://terminology.hl7.org/CodeSystem/v3-ActReason",
                    "code": substitutionAllowedCode,
                    "display": substitutionAllowedDisplay,
                  }
                ]
              }
            }
          },
        ),
      );
      warningLog(
          'checking for the response ${response.statusCode} and its body ${response.body}');

      final responseBody = json.decode(response.body);
      final String medicationRequestFhirID = responseBody['id'];
      final String source = responseBody['meta']['source'];
      warningLog(
          'Checking for Fhir Id $medicationRequestFhirID and source $source');
      MedicationRequestModel medicationRequestModel = MedicationRequestModel(
        medicationRequestSource: source,
        medicationRequestFhirID: medicationRequestFhirID,
        medicationRequestId: medicationRequestId,
        medicationId: medicationId,
        medicationCode: medicationCode,
        medicationDisplay: medicationDisplay,
        medicineCode: medicineCode,
        medicineName: medicineName,
        status: status,
        identifier: identifier,
        intent: intent,
        categoryCode: categoryCode,
        categoryDisplay: categoryDisplay,
        patientId: patientId,
        patientName: patientName,
        encounterId: encounterId,
        encounterDisplay: encounterDisplay,
        supportingInfoProcedure: supportingInfoProcedure,
        authoredOnDate: authoredOnDate,
        practitionerName: practitionerName,
        practitionerId: practitionerId,
        reasonCode: reasonCode,
        reasonDisplay: reasonDisplay,
        notes: notes,
        dosageInstruction: dosageInstruction,
        dosageInstructionCode: dosageInstructionCode,
        additionalDosageInstructionText: additionalDosageInstructionText,
        frequency: frequency,
        period: period,
        periodUnit: periodUnit,
        when: when,
        routeCode: routeCode,
        routeMessage: routeMessage,
        methodCode: methodCode,
        methodText: methodText,
        doseRangeHighCode: doseRangeHighCode,
        doseRangeHighUnit: doseRangeHighUnit,
        doseRangeHighValue: doseRangeHighValue,
        doseRangeLowCode: doseRangeLowCode,
        doseRangeLowUnit: doseRangeLowUnit,
        doseRangeLowValue: doseRangeLowValue,
        doseRateTypeCode: doseRateTypeCode,
        doseRateTypeDisplay: doseRateTypeDisplay,
        dispenseRequestStartDate: dispenseRequestStartDate,
        dispenseRequestEndDate: dispenseRequestEndDate,
        dispenseRequestNumberOfRequests: dispenseRequestNumberOfRequests,
        dispenseRequestQuantityValue: dispenseRequestQuantityValue,
        dispenseRequestQuantityCode: dispenseRequestQuantityCode,
        dispenseRequestQuantityUnit: dispenseRequestQuantityUnit,
        expectedSupplyDurationValue: expectedSupplyDurationValue,
        expectedSupplyDurationUnit: expectedSupplyDurationUnit,
        expectedSupplyDurationCode: expectedSupplyDurationCode,
        substitutionAllowed: substitutionAllowed,
        substitutionAllowedCode: substitutionAllowedCode,
        substitutionAllowedDisplay: substitutionAllowedDisplay,
      );
      await createMedicationRequestResourceINFb(
          medicationRequestModel: medicationRequestModel);
      return medicationRequestModel;
    } catch (e) {
      rethrow;
    }
  }

  createMedicationRequestResourceINFb(
      {required MedicationRequestModel medicationRequestModel}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/MedicationRequest.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          "medicationRequestId": medicationRequestModel.medicationRequestId,
          "medicationId": medicationRequestModel.medicationId,
          "medicationCode": medicationRequestModel.medicationCode,
          "medicationDisplay": medicationRequestModel.medicationDisplay,
          "medicineCode": medicationRequestModel.medicationCode,
          "medicineName": medicationRequestModel.medicineName,
          "identifier": medicationRequestModel.identifier,
          "status": medicationRequestModel.status,
          "intent": medicationRequestModel.intent,
          "categoryCode": medicationRequestModel.categoryCode,
          "categoryDisplay": medicationRequestModel.categoryDisplay,
          'medicationRequestFhirID':
              medicationRequestModel.medicationRequestFhirID,
          'medicationRequestSource':
              medicationRequestModel.medicationRequestSource,
          "patientId": medicationRequestModel.patientId,
          "patientName": medicationRequestModel.patientName,
          "encounterId": medicationRequestModel.encounterId,
          "encounterDisplay": medicationRequestModel.encounterDisplay,
          "supportingInfoProcedure":
              medicationRequestModel.supportingInfoProcedure,
          "authoredOnDate": medicationRequestModel.authoredOnDate,
          "practitionerName": medicationRequestModel.practitionerName,
          "practitionerId": medicationRequestModel.practitionerId,
          "reasonCode": medicationRequestModel.reasonCode,
          "reasonDisplay": medicationRequestModel.reasonDisplay,
          "notes": medicationRequestModel.notes,
          "dosageInstruction": medicationRequestModel.dosageInstruction,
          "dosageInstructionCode": medicationRequestModel.dosageInstructionCode,
          "additionalDosageInstructionText":
              medicationRequestModel.additionalDosageInstructionText,
          "frequency": medicationRequestModel.frequency,
          "period": medicationRequestModel.period,
          "periodUnit": medicationRequestModel.periodUnit,
          "when": medicationRequestModel.when,
          "routeCode": medicationRequestModel.routeCode,
          "routeMessage": medicationRequestModel.routeMessage,
          "methodText": medicationRequestModel.methodText,
          "methodCode": medicationRequestModel.methodCode,
          "doseRateTypeCode": medicationRequestModel.doseRateTypeCode,
          "doseRateTypeDisplay": medicationRequestModel.doseRateTypeDisplay,
          "doseRangeLowValue": medicationRequestModel.doseRangeLowValue,
          "doseRangeLowUnit": medicationRequestModel.doseRangeLowUnit,
          "doseRangeLowCode": medicationRequestModel.doseRangeLowCode,
          "doseRangeHighValue": medicationRequestModel.doseRangeHighValue,
          "doseRangeHighUnit": medicationRequestModel.doseRangeHighUnit,
          "doseRangeHighCode": medicationRequestModel.doseRangeHighCode,
          "dispenseRequestStartDate":
              medicationRequestModel.dispenseRequestStartDate,
          "dispenseRequestEndDate":
              medicationRequestModel.dispenseRequestEndDate,
          "dispenseRequestNumberOfRequests":
              medicationRequestModel.dispenseRequestNumberOfRequests,
          "dispenseRequestQuantityValue":
              medicationRequestModel.dispenseRequestQuantityValue,
          "dispenseRequestQuantityUnit":
              medicationRequestModel.dispenseRequestQuantityUnit,
          "dispenseRequestQuantityCode":
              medicationRequestModel.dispenseRequestQuantityCode,
          "expectedSupplyDurationValue":
              medicationRequestModel.expectedSupplyDurationValue,
          "expectedSupplyDurationUnit":
              medicationRequestModel.expectedSupplyDurationUnit,
          "expectedSupplyDurationCode":
              medicationRequestModel.expectedSupplyDurationCode,
          "substitutionAllowed": medicationRequestModel.substitutionAllowed,
          "substitutionAllowedCode":
              medicationRequestModel.substitutionAllowedCode,
          "substitutionAllowedDisplay":
              medicationRequestModel.substitutionAllowedDisplay,
        }),
      );
      warningLog('Checking the code ${response.statusCode}');
      final responseBody = json.decode(response.body);
      warningLog('$responseBody');
    } catch (e) {
      rethrow;
    }
  }
}
