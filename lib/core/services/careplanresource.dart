import 'dart:convert';

import 'package:fhirpat/core/blocs/fhirpat/fhirpat_bloc.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/careplan.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CarePlanResourceService with LogMixin {
  Future<CarePlanModel> sendCarePlanToHapiServer(
      {required String carePlanID,
      required String identifier,
      required String status,
      required String intent,
      required String patientId,
      required String patientName,
      required String startPeriod,
      required String endPeriod,
      required String practitionerId,
      required String practitionerName,
      required String conditionID,
      required String conditionName,
      required String lifeCycleStatus,
      required String achievementStatus,
      required String carePlanStatus,
      required String carePlanIntent,
      required String achievementStatusCode,
      required String description,
      required String note,
      required String activityPlannedReference,
      required String activityStatus,
      required String activityIntent,
      required String activityCode,
      required String activityDisplay,
      required String occurenceTime}) async {
    final url = Uri.parse('http://hapi.fhir.org/baseR4/CarePlan');
    final headers = {'Content-Type': 'application/fhir+json'};
    final dateFormat = DateFormat('yyyy-MM-dd');
    final inputStartDate = DateTime.parse(startPeriod);
    final formattedStartDate = dateFormat.format(inputStartDate);
    final inputEndDate = DateTime.parse(endPeriod);
    final formattedEndDate = dateFormat.format(inputEndDate);
    final occurenceDate = DateTime.parse(occurenceTime);
    final outputFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    final formattedOccurenceDate = outputFormat.format(occurenceDate);
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            {
              "resourceType": "CarePlan",
              "id": carePlanID,
              "text": {
                "status": "generated",
              },
              "contained": [
                {
                  "resourceType": "CareTeam",
                  "id": "careteam",
                  "participant": [
                    {
                      "member": {
                        "reference": "Practitioner/${practitionerId.trim()}",
                        "display": practitionerName.trim()
                      }
                    }
                  ]
                },
                {
                  "resourceType": "Goal",
                  "id": "goal",
                  "lifecycleStatus": lifeCycleStatus.trim(),
                  "achievementStatus": {
                    "coding": [
                      {
                        "system":
                            "http://terminology.hl7.org/CodeSystem/goal-achievement",
                        "code": achievementStatusCode.trim(),
                        "display": achievementStatus.trim(),
                      }
                    ],
                  },
                  "description": {
                    "text": description.trim(),
                  },
                  "subject": {
                    "reference": "Patient/${patientId.trim()}",
                    "display": patientName.trim(),
                  },
                  "note": [
                    {
                      "text": note.trim(),
                    }
                  ]
                },
                {
                  "resourceType": "ServiceRequest",
                  "id": "activity",
                  "status": activityStatus.trim(),
                  "intent": activityIntent.trim(),
                  "code": {
                    "concept": {
                      "coding": [
                        {
                          "system": "http://snomed.info/sct",
                          "code": activityCode.trim(),
                          "display": activityDisplay.trim()
                        }
                      ]
                    }
                  },
                  "subject": {
                    "reference": "Patient/${patientId.trim()}",
                    "display": patientName.trim(),
                  },
                  "occurrenceDateTime": formattedOccurenceDate,
                  "performer": [
                    {
                      "reference": "Practitioner/${practitionerId.trim()}",
                      "display": practitionerName.trim(),
                    }
                  ]
                }
              ],
              "identifier": [
                {
                  "use": "official",
                  "system":
                      "http://www.bmc.nl/zorgportal/identifiers/careplans",
                  "value": identifier.trim(),
                }
              ],
              "status": carePlanStatus,
              "intent": carePlanIntent,
              "subject": {
                "reference": "Patient/${patientId.trim()}",
                "display": practitionerName.trim(),
              },
              "period": {"start": formattedStartDate, "end": formattedEndDate},
              "careTeam": [
                {"reference": "#careteam"}
              ],
              "addresses": [
                {
                  "reference": {
                    "reference": "Condition/$conditionID",
                    "display": conditionName
                  }
                }
              ],
              "goal": [
                {"reference": "#goal"}
              ],
              "activity": [
                {
                  "plannedActivityReference": {"reference": "#activity"}
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
      CarePlanModel carePlanModel = CarePlanModel(
        carePlanID: carePlanID,
        identifier: identifier,
        careFhirID: fhirId,
        careSource: source,
        status: status,
        intent: intent,
        patientId: patientId,
        occurenceDate: formattedOccurenceDate,
        patientName: patientName,
        startPeriod: formattedStartDate,
        endPeriod: formattedEndDate,
        practitionerId: practitionerId,
        practitionerName: practitionerName,
        conditionID: conditionID,
        conditionName: conditionName,
        lifeCycleStatus: lifeCycleStatus,
        achievementStatus: achievementStatus,
        achievementStatusCode: achievementStatusCode,
        descrption: description,
        note: note,
        activityPlannedReference: activityPlannedReference,
        activityStatus: activityStatus,
        activityIntent: activityIntent,
        activityCode: activityCode,
        carePlanStatus: carePlanStatus,
        carePlanIntent: carePlanIntent,
        acitivityDisplay: activityDisplay,
      );
      await createCarePlanResourceInFB(carePlanModel: carePlanModel);
      return carePlanModel;
    } catch (e) {
      throw FhirCreateCarePlanErrorState(
        message: e.toString(),
      );
    }
  }

  Future<CarePlanModel> createCarePlanResourceInFB(
      {required CarePlanModel carePlanModel}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/CarePlan.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "carePlanID": carePlanModel.carePlanID,
            "careFhirID": carePlanModel.careFhirID,
            "careSource": carePlanModel.careSource,
            "identifier": carePlanModel.identifier,
            "status": carePlanModel.status,
            "intent": carePlanModel.intent,
            "patientId": carePlanModel.patientId,
            "patientName": carePlanModel.patientName,
            "startPeriod": carePlanModel.startPeriod,
            "endPeriod": carePlanModel.endPeriod,
            "practitionerId": carePlanModel.practitionerId,
            "practitionerName": carePlanModel.practitionerName,
            "conditionID": carePlanModel.conditionID,
            "conditionName": carePlanModel.conditionName,
            "lifeCycleStatus": carePlanModel.lifeCycleStatus,
            "achievementStatus": carePlanModel.achievementStatus,
            "description": carePlanModel.descrption,
            "note": carePlanModel.note,
            "activityPlannedReference": carePlanModel.activityPlannedReference,
            "activityStatus": carePlanModel.achievementStatus,
            "activityIntent": carePlanModel.activityIntent,
            "activityCode": carePlanModel.activityCode,
            "activityDisplay": carePlanModel.acitivityDisplay,
            "occurenceDate": carePlanModel.occurenceDate
          },
        ),
      );
      warningLog('${response.statusCode}, ${response.body}');
      final responseBody = json.decode(response.body);
      warningLog('checking for response body$responseBody');
      return carePlanModel;
    } catch (e) {
      rethrow;
    }
  }
}
