import 'dart:convert';

import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/claimmodel.dart';
import 'package:http/http.dart' as http;

class ClaimService with LogMixin {
  Future<ClaimDataModel> sendClaimDetailsToHapi({
    required String claimID,
    required String patientId,
    required String patientFamilyName,
    required String patientName,
    required String patientGender,
    required String patientDOB,
    required String patientPhoneNumber,
    required String patientEmail,
    required String patientAddress,
    required String patientCity,
    required String patientLineAddress,
    required String patientCityAddress,
    required String patientStateAdress,
    required String patientCountryAdress,
    required String patientPostalCode,
    required String coverageId,
    required String coverageIdentifierValue,
    required String coverageStatus,
    required String coverageValue,
    required String coverageKind,
    required String coverageTypeCode,
    required String coverageTypeDisplay,
    required String relationshipCode,
    required String startDate,
    required String endDate,
    required String insurerId,
    required String insurerDisplay,
    required String classCode,
    required String classValue,
    required String use,
    required String typeCode,
    required String subTypeCode,
    required String subTypeName,
    required String status,
    required String organizationId,
    required String priorityCode,
    required String payeeCode,
    required String practitionerName,
    required String patientStatusCode,
    required String diagnosisCode,
    required String diagnosisDisplay,
    required String insuranceFocal,
    required String insuranceId,
    required String careTeamSequence,
    required String informationSequence,
    required String serviceCode,
    required String serviceDisplay,
    required String servicedDate,
    required String locationCode,
    required String locationDisplay,
    required double unitPrice,
    required String currency,
    required double netValue,
    required double totalValue,
  }) async {
    final url = Uri.parse('http://hapi.fhir.org/baseR4/Claim');
    final headers = {'Content-Type': 'application/fhir+json'};
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "resourceType": "Claim",
            "id": claimID,
            "text": {
              "status": "generated",
            },
            "contained": [
              {
                "resourceType": "Patient",
                "id": patientId,
                "name": [
                  {
                    "use": "official",
                    "family": patientFamilyName,
                    "given": [patientName]
                  }
                ],
                "gender": patientGender,
                "birthDate": patientDOB,
                "address": [
                  {
                    "use": "home",
                    "line": [patientLineAddress],
                    "city": patientCityAddress,
                    "state": patientStateAdress,
                    "postalCode": patientPostalCode,
                    "country": patientCountryAdress,
                  }
                ]
              },
              {
                "resourceType": "Coverage",
                "id": coverageId,
                "identifier": [
                  {
                    "system": "http://benefitsinc.com/certificate",
                    "value": coverageIdentifierValue
                  }
                ],
                "status": coverageStatus,
                "kind": coverageKind,
                "type": {
                  "coding": [
                    {
                      "system":
                          "http://terminology.hl7.org/CodeSystem/v3-ActCode",
                      "code": coverageTypeCode,
                      "display": coverageTypeDisplay
                    }
                  ]
                },
                "subscriber": {"reference": "#$patientId"},
                "beneficiary": {"reference": "#$patientId"},
                "relationship": {
                  "coding": [
                    {"code": relationshipCode}
                  ]
                },
                "period": {
                  "start": startDate,
                  "end": endDate,
                },
                "insurer": {
                  "identifier": {
                    "system": "http://www.bindb.com/bin",
                    "value": insurerId
                  },
                  "display": insurerDisplay,
                },
                "class": [
                  {
                    "type": {
                      "coding": [
                        {
                          "system":
                              "http://terminology.hl7.org/CodeSystem/coverage-class",
                          "code": classCode,
                        }
                      ]
                    },
                    "value": {
                      "value": classValue,
                    }
                  }
                ]
              }
            ],
            "identifier": [
              {
                "system": "http://CedarArmsMedicalCenter.com/claim",
                "value": "MED-00050"
              }
            ],
            "status": status,
            "type": {
              "coding": [
                {
                  "system": "http://terminology.hl7.org/CodeSystem/claim-type",
                  "code": typeCode,
                }
              ]
            },
            "subType": {
              "coding": [
                {
                  "system": "https://www.cms.gov/codes/billtype",
                  "code": subTypeCode,
                  "display": subTypeName,
                }
              ]
            },
            "use": use,
            "patient": {"reference": "#patient-1"},
            "created": DateTime.now().toIso8601String(),
            "insurer": {
              "identifier": {
                "system": "http://www.bindb.com/bin",
                "value": insurerId
              },
              "display": insurerDisplay,
            },
            "provider": {"reference": "Organization/$organizationId"},
            "priority": {
              "coding": [
                {
                  "code": priorityCode,
                }
              ]
            },
            "payee": {
              "type": {
                "coding": [
                  {
                    "system": "http://terminology.hl7.org/CodeSystem/payeetype",
                    "code": payeeCode
                  }
                ]
              },
              "party": {"reference": "Organization/$organizationId"}
            },
            "careTeam": [
              {
                "sequence": 1,
                "provider": {"reference": "Practitioner/$practitionerName"}
              }
            ],
            "supportingInfo": [
              {
                "sequence": 1,
                "category": {
                  "coding": [
                    {
                      "system":
                          "http://terminology.hl7.org/CodeSystem/claiminformationcategory",
                      "code": patientStatusCode,
                    }
                  ]
                },
              },
            ],
            "diagnosis": [
              {
                "sequence": 1,
                "diagnosisCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://hl7.org/fhir/sid/icd-10-cm",
                      "code": diagnosisCode,
                      "display": diagnosisDisplay,
                    }
                  ]
                }
              },
            ],
            "insurance": [
              {
                "sequence": 1,
                "focal": insuranceFocal,
                "identifier": {
                  "system": "http://CedarArmsMedicalCenter.com/claim",
                  "value": insuranceId,
                },
                // "coverage": {"reference": "#coverage-1"}
              }
            ],
            "item": [
              {
                "sequence": 1,
                "careTeamSequence": [careTeamSequence],
                "informationSequence": [informationSequence],
                "productOrService": {
                  "coding": [
                    {
                      "system": "http://www.ama-assn.org/go/cpt",
                      "code": serviceCode,
                      "display": serviceDisplay
                    }
                  ]
                },
                "servicedDate": servicedDate,
                "locationCodeableConcept": {
                  "coding": [
                    {
                      "system":
                          "https://www.cms.gov/medicare/coding/place-of-service-codes/place_of_service_code_set.html",
                      "code": locationCode,
                      "display": locationDisplay
                    }
                  ]
                },
                "unitPrice": {"value": unitPrice, "currency": currency},
                "net": {"value": netValue, "currency": currency}
              }
            ],
            "total": {"value": totalValue, "currency": currency}
          },
        ),
      );

      warningLog(
          '${response.statusCode} and body of the hapi diagonistic report ${response.body}');
      final responseBody = json.decode(response.body);
      final String claimFhirId = responseBody['id'];
      final String claimSource = responseBody['meta']['source'];

      final ClaimDataModel claim = ClaimDataModel(
        claimID: claimID,
        patientId: patientId,
        patientFamilyName: patientFamilyName,
        patientName: patientName,
        patientGender: patientGender,
        patientDOB: patientDOB,
        patientPhoneNumber: patientPhoneNumber,
        patientEmail: patientEmail,
        patientAddress: patientAddress,
        patientCity: patientCity,
        patientLineAddress: patientLineAddress,
        patientCityAddress: patientCityAddress,
        patientStateAdress: patientStateAdress,
        patientCountryAdress: patientCountryAdress,
        patientPostalCode: patientPostalCode,
        coverageId: coverageId,
        coverageIdentifierValue: coverageIdentifierValue,
        coverageStatus: coverageStatus,
        coverageValue: coverageValue,
        coverageKind: coverageKind,
        coverageTypeCode: coverageTypeCode,
        coverageTypeDisplay: coverageTypeDisplay,
        relationshipCode: relationshipCode,
        startDate: startDate,
        endDate: endDate,
        insurerId: insurerId,
        insurerDisplay: insurerDisplay,
        classCode: classCode,
        classValue: classValue,
        use: use,
        typeCode: typeCode,
        subTypeCode: subTypeCode,
        subTypeName: subTypeName,
        status: status,
        organizationId: organizationId,
        priorityCode: priorityCode,
        payeeCode: payeeCode,
        practitionerName: practitionerName,
        patientStatusCode: patientStatusCode,
        diagnosisCode: diagnosisCode,
        diagnosisDisplay: diagnosisDisplay,
        insuranceFocal: insuranceFocal,
        insuranceId: insuranceId,
        careTeamSequence: careTeamSequence,
        informationSequence: informationSequence,
        serviceCode: serviceCode,
        serviceDisplay: serviceDisplay,
        servicedDate: servicedDate,
        locationCode: locationCode,
        locationDisplay: locationDisplay,
        unitPrice: unitPrice,
        currency: currency,
        netValue: netValue,
        totalValue: totalValue,
        fhirId: claimFhirId,
        source: claimSource,
      );
      await createClaimInFB(claim: claim);
      return claim;
    } catch (e) {
      rethrow;
    }
  }

  createClaimInFB({required ClaimDataModel claim}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/Claim.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'claimID': claim.claimID,
          'patientId': claim.patientId,
          'patientFamilyName': claim.patientFamilyName,
          'patientName': claim.patientName,
          'patientGender': claim.patientGender,
          'patientDOB': claim.patientDOB,
          'patientPhoneNumber': claim.patientPhoneNumber,
          'patientEmail': claim.patientEmail,
          'patientAddress': claim.patientAddress,
          'patientCity': claim.patientCity,
          'patientLineAddress': claim.patientLineAddress,
          'patientCityAddress': claim.patientCityAddress,
          'patientStateAdress': claim.patientStateAdress,
          'patientCountryAdress': claim.patientCountryAdress,
          'patientPostalCode': claim.patientPostalCode,
          'coverageId': claim.coverageId,
          'coverageIdentifierValue': claim.coverageIdentifierValue,
          'coverageStatus': claim.coverageStatus,
          'coverageValue': claim.coverageValue,
          'coverageKind': claim.coverageKind,
          'coverageTypeCode': claim.coverageTypeCode,
          'coverageTypeDisplay': claim.coverageTypeDisplay,
          'relationshipCode': claim.relationshipCode,
          'startDate': claim.startDate,
          'endDate': claim.endDate,
          'insurerId': claim.insurerId,
          'insurerDisplay': claim.insurerDisplay,
          'classCode': claim.classCode,
          'classValue': claim.classValue,
          'use': claim.use,
          'typeCode': claim.typeCode,
          'subTypeCode': claim.subTypeCode,
          'subTypeName': claim.subTypeName,
          'status': claim.status,
          'organizationId': claim.organizationId,
          'priorityCode': claim.priorityCode,
          'payeeCode': claim.payeeCode,
          'practitionerName': claim.practitionerName,
          'patientStatusCode': claim.patientStatusCode,
          'diagnosisCode': claim.diagnosisCode,
          'diagnosisDisplay': claim.diagnosisDisplay,
          'insuranceFocal': claim.insuranceFocal,
          'insuranceId': claim.insuranceId,
          'careTeamSequence': claim.careTeamSequence,
          'informationSequence': claim.informationSequence,
          'serviceCode': claim.serviceCode,
          'serviceDisplay': claim.serviceDisplay,
          'servicedDate': claim.servicedDate,
          'locationCode': claim.locationCode,
          'locationDisplay': claim.locationDisplay,
          'unitPrice': claim.unitPrice,
          'currency': claim.currency,
          'netValue': claim.netValue,
          'totalValue': claim.totalValue,
          'fhirId': claim.fhirId,
          'source': claim.source,
        }),
      );
      warningLog(
          'response statusCode diagnostic Report ${response.statusCode} and body ${response.body}');
      final responseBody = json.decode(response.body);
      warningLog('Response Body $responseBody');
    } catch (e) {
      rethrow;
    }
  }
}
