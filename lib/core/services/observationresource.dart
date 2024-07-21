import 'dart:convert';

import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/observation_model.dart';
import 'package:intl/intl.dart';
import 'package:fhir/r5.dart' as fhir;
import 'package:http/http.dart' as http;

class ObservationResource with LogMixin {
  Future<ObservationModel> sendObservationDetailsToHapi({
    required String existingPatientId,
    required String patientName,
    required String practitionerName,
    required String condition,
    required String status,
    required String typeCode,
    required String typeValue,
    required String valueQuantity,
    required String observationId,
    required String conditionId,
    required String practitionerId,
    required String interpretationCode,
    required String interpretationDisplay,
    required String valueUnit,
    required String valueCode,
    required dynamic lowReferenceRangeQuantityValue,
    required String lowReferenceRangeUnitValue,
    required dynamic lowReferenceRangeCodeValue,
    required dynamic highReferenceRangeQuantityValue,
    required String highReferenceRangeUnitValue,
    required dynamic highReferenceRangeCodeValue,
    required String identifier,
    String? methodCode,
    String? methodText,
  }) async {
    final url = Uri.parse('http://hapi.fhir.org/baseR4/Observation');
    final headers = {'Content-Type': 'application/fhir+json'};
    DateTime currentTime = DateTime.now();
    String formattedDateTime =
        DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(currentTime);
    warningLog('Observation to Hapi Started');
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "resourceType": "Observation",
            "id": observationId.trim(),
            "text": {
              "status": "generated",
              "div":
                  "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: Observation</b><a name=\"f002\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource Observation &quot;f002&quot; </p></div><p><b>identifier</b>: <span title=\"   urn:oid:2.16.840.1.113883.4.642.1.7   &amp;#10;   2.16.840.1.113883.4.642.1.118   \">id:\u00a06324\u00a0(use:\u00a0OFFICIAL)</span></p><p><b>status</b>: final</p><p><b>code</b>: Base excess in Blood by calculation <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"https://loinc.org/\">LOINC</a>#11555-0)</span></p><p><b>subject</b>: <a href=\"patient-example-f001-pieter.html\">Patient/f001: P. van de Heuvel</a> &quot;Pieter VAN DE HEUVEL&quot;</p><p><b>effective</b>: 2013-04-02T10:30:10+01:00</p><p><b>issued</b>: 4 Apr 2013, 1:30:10 am</p><p><b>performer</b>: <a href=\"practitioner-example-f005-al.html\">Practitioner/f005: A. Langeveld</a> &quot;Langeveld ANNE&quot;</p><p><b>value</b>: 12.6 mmol/l<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM code mmol/L = 'mmol/L')</span></p><p><b>interpretation</b>: High <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.1.0/CodeSystem-v3-ObservationInterpretation.html\">ObservationInterpretation</a>#H)</span></p><h3>ReferenceRanges</h3><table class=\"grid\"><tr><td>-</td><td><b>Low</b></td><td><b>High</b></td></tr><tr><td>*</td><td>7.1 mmol/l<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM code mmol/L = 'mmol/L')</span></td><td>11.2 mmol/l<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM code mmol/L = 'mmol/L')</span></td></tr></table></div>"
            },
            "identifier": [
              {
                "use": "official",
                "system":
                    "http://www.bmc.nl/zorgportal/identifiers/observations",
                "value": identifier.trim(),
              }
            ],
            "status": fhir.FhirCode(status),
            "code": {
              "coding": [
                {
                  "system": "http://loinc.org",
                  "code": conditionId.trim(),
                  "display": condition.trim(),
                }
              ]
            },
            "subject": {
              "reference": "Patient/${existingPatientId.trim()}",
              "display": patientName.trim(),
            },
            "effectiveDateTime": formattedDateTime,
            "issued": formattedDateTime,
            "performer": [
              {
                // "reference": "Practitioner/${practitionerId.trim()}",
                "display": practitionerName.trim(),
              }
            ],
            "valueQuantity": {
              "value": valueQuantity.trim(),
              "unit": valueUnit.trim(),
              "system": "http://unitsofmeasure.org",
              "code": valueCode.trim(),
            },
            "interpretation": [
              {
                "coding": [
                  {
                    "system":
                        "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
                    "code": interpretationCode.trim(),
                    "display": interpretationDisplay.trim()
                  }
                ]
              }
            ],
            "referenceRange": [
              {
                "low": {
                  "value": lowReferenceRangeQuantityValue.toString().trim(),
                  "unit": lowReferenceRangeUnitValue.toString().trim(),
                  "system": "http://unitsofmeasure.org",
                  "code": lowReferenceRangeCodeValue.toString().trim()
                },
                "high": {
                  "value": highReferenceRangeQuantityValue.toString().trim(),
                  "unit": highReferenceRangeUnitValue.toString().trim(),
                  "system": "http://unitsofmeasure.org",
                  "code": highReferenceRangeCodeValue.toString().trim(),
                },
                "type": {
                  "coding": [
                    {
                      "system":
                          "http://terminology.hl7.org/CodeSystem/referencerange-meaning",
                      "code": typeCode.trim(),
                      "display": typeValue.trim(),
                    }
                  ]
                }
              }
            ]
          },
        ),
      );
      warningLog(
          'checking for the response ${response.statusCode} and its body ${response.body}');

      final responseBody = json.decode(response.body);
      // warningLog(
      //     '${responseBody['resourceType']} and issue ${responseBody['issue']['diagnostics']} ');
      final String fhirId = responseBody['id'];
      final String source = responseBody['meta']['source'];
      warningLog('Checking for Fhir Id $fhirId and source $source');
      ObservationModel observationModel = ObservationModel(
        existingPatientId: existingPatientId,
        patientName: patientName,
        observationId: observationId,
        practitionerName: practitionerName,
        condition: condition,
        status: status,
        typeCode: typeCode,
        typeDisplay: typeValue,
        valueQuantity: valueQuantity,
        conditionId: conditionId,
        practitionerId: practitionerId,
        interpretationCode: interpretationCode,
        interpretationDisplay: interpretationDisplay,
        lowReferenceRangeQuantityValue: lowReferenceRangeQuantityValue,
        lowReferenceRangeCodeValue: lowReferenceRangeCodeValue,
        lowReferenceRangeUnitValue: lowReferenceRangeUnitValue,
        highReferenceRangeQuantityValue: highReferenceRangeQuantityValue,
        highReferenceRangeCodeValue: highReferenceRangeCodeValue,
        highReferenceRangeUnitValue: highReferenceRangeUnitValue,
        observationFhirId: fhirId,
        observationSource: source,
      );
      await createObservationCollectionInFb(observationModel: observationModel);
      return observationModel;
    } catch (e) {
      warningLog(e.toString());
      rethrow;
    }
  }

  Future<ObservationModel> createObservationCollectionInFb(
      {required final ObservationModel observationModel}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/Observation.json');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'observationFhirId': observationModel.observationFhirId,
            'observationSource': observationModel.observationSource,
            'observationId': observationModel.observationId,
            'existingPatientId': observationModel.existingPatientId,
            'patientName': observationModel.patientName,
            'practitionerName': observationModel.practitionerName,
            'condition': observationModel.condition,
            'status': observationModel.status,
            'typeCode': observationModel.typeCode,
            'typeDisplay': observationModel.typeDisplay,
            'valueQuantity': observationModel.valueQuantity,
            'conditionId': observationModel.conditionId,
            'practitionerId': observationModel.practitionerId,
            'interpretationCode': observationModel.interpretationCode,
            'interpretationDisplay': observationModel.interpretationDisplay,
            'lowReferenceRangeQuantityValue':
                observationModel.lowReferenceRangeQuantityValue,
            'lowReferenceRangeCodeValue':
                observationModel.lowReferenceRangeCodeValue,
            'lowReferenceRangeUnitValue':
                observationModel.lowReferenceRangeUnitValue,
            'highReferenceRangeQuantityValue':
                observationModel.highReferenceRangeQuantityValue,
            'highReferenceRangeCodeValue':
                observationModel.highReferenceRangeCodeValue,
            'highReferenceRangeUnitValue':
                observationModel.highReferenceRangeUnitValue,
            'methodCode': observationModel.methodCode,
            'methodText': observationModel.methodText,
          },
        ),
      );
      warningLog('${response.statusCode}, ${response.body}');
      final responseBody = json.decode(response.body);
      warningLog('checking for response body$responseBody');
      return observationModel;
    } catch (e) {
      rethrow;
    }
  }
}
