import 'dart:convert';
import 'dart:io';

import 'package:fhirpat/core/blocs/fhirpat/fhirpat_bloc.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/repository/storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as im;
import 'package:http/http.dart' as http;

class PatientResourceService with LogMixin {
  final storageRefUserProfile = FirebaseStorage.instance.ref();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file;
  List<FhirPatientModel> fhirPatientModel = [];

  List<FhirPatientModel> get fhirPatModel {
    return fhirPatientModel;
  }

  XFile? get image {
    return _file;
  }

  Future<XFile?> handlecameraOpening() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 70);
    warningLog('Image $image');
    return image;
  }

  Future<XFile?> handleGallerOpening() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 70);
    debugLog('$image');
    return image;
  }

  Future<XFile?> getLostData() async {
    final LostDataResponse response = await _imagePicker.retrieveLostData();
    if (response.isEmpty) {
      return null;
    }
    if (response.file != null) {
      _file = response.file;
      return _file;
    } else {
      return null;
    }
  }

  Future<File?> compressMedia({XFile? xfile, String? userID}) async {
    File file = File(xfile!.path);
    final tempdir = await getTemporaryDirectory();
    final path = tempdir.path;
    im.Image? imageFile = im.decodeImage(file.readAsBytesSync());
    final compressedMedia = File('$path/img_$userID.jpg')
      ..writeAsBytesSync(im.encodeJpg(imageFile!, quality: 85));
    return compressedMedia;
  }

  Future<String?> uploadMedia({File? file, String? userID}) async {
    final ref = storageRefUserProfile
        .child('UserProfile_Images')
        .child('ProfilePic_$userID}');
    final TaskSnapshot task = await ref.putFile(file!);
    warningLog('${task.storage}');
    final String downloadUrl = await ref.getDownloadURL();
    warningLog(downloadUrl);
    return downloadUrl;
  }

  Future<FhirPatientModel> sendPatientDetailsToHapi({
    required String patientId,
    required String patientName,
    required String patientFamilyName,
    required String patientPhone,
    required String patientGender,
    required String patientAddressLine,
    required String patientAddressCity,
    required String patientAddressPostCode,
    required String patientAddressCountry,
    required String patientRelation,
    required String patientRelationFamilyName,
    required String patientRelationPhone,
    required String patientRelationAddress,
    required String patientRelationGender,
    required String patientCommunication,
    required String patientGeneralPractitioner,
    required String patientManagingOrganization,
    required String patientLink,
    required String patientSuffix,
    required String patientEmail,
    required String patientDoB,
    required String countryCode,
    required String patientManagingOrganizationCode,
    required File xFileFhir,
    required bool deceased,
  }) async {
    final url = Uri.parse('http://hapi.fhir.org/baseR4/Patient');
    final headers = {'Content-Type': 'application/fhir+json'};
    DateTime birthData = DateFormat('dd/MM/yyy').parse(patientDoB);
    String birthDateString = birthData.toIso8601String();
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "resourceType": "Patient",
            "id": patientId,
            "text": {
              "status": "generated",
              "div":
                  "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\"><b>Pieter van de Heuvel </b> male, DoB: 1944-11-17 ( id:\u00a0738472983\u00a0(use:\u00a0USUAL))</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Record is active\">Active:</td><td>true</td><td style=\"background-color: #f3f5da\" title=\"Known status of Patient\">Deceased:</td><td>false</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Known Marital status of Patient\">Marital Status:</td><td><span title=\"Codes: {http://terminology.hl7.org/CodeSystem/v3-MaritalStatus M}\">Getrouwd</span></td><td style=\"background-color: #f3f5da\" title=\"Known multipleBirth status of Patient\">Multiple Birth:</td><td colspan=\"3\">true</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Other Ids (see the one above)\">Other Id:</td><td colspan=\"3\">id:\u00a0?ngen-9?\u00a0(use:\u00a0USUAL)</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Details:</td><td colspan=\"3\"><ul><li>ph: 0648352638(MOBILE)</li><li><a href=\"mailto:p.heuvel@gmail.com\">p.heuvel@gmail.com</a></li><li>Van Egmondkade 23 Amsterdam 1024 RJ NLD (HOME)</li></ul></td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Languages spoken\">Language:</td><td colspan=\"3\"><span title=\"Codes: {urn:ietf:bcp:47 nl}\">Nederlands</span> (preferred)</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Nominated Contact: Emergency Contact\">Emergency Contact:</td><td colspan=\"3\"><ul><li>Sarah Abels </li><li>ph: 0690383372(MOBILE)</li></ul></td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Patient Links\">Links:</td><td colspan=\"3\"><ul><li>Managing Organization: <a href=\"organization-example-f001-burgers.html\">Organization/f001: Burgers University Medical Centre</a> &quot;Burgers University Medical Center&quot;</li></ul></td></tr></table></div>"
            },
            "identifier": [
              {
                "use": "usual",
                "system": "urn:oid:2.16.840.1.113883.2.4.6.3",
                "value": patientId
              },
              {"use": "usual", "system": "urn:oid:2.16.840.1.113883.2.4.6.3"}
            ],
            "active": true,
            "name": [
              {
                "use": "usual",
                "family": patientFamilyName,
                "given": [patientName],
                "suffix": [patientSuffix]
              }
            ],
            "telecom": [
              {"system": "phone", "value": patientPhone, "use": "mobile"},
              {"system": "email", "value": patientEmail, "use": "home"}
            ],
            "gender": patientGender,
            "birthDate": birthDateString,
            "deceasedBoolean": deceased,
            "address": [
              {
                "use": "home",
                "line": [patientAddressLine],
                "city": patientAddressCity,
                "postalCode": patientAddressPostCode,
                "country": patientAddressCountry,
              }
            ],
            "maritalStatus": {
              "coding": [
                {
                  "system":
                      "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
                  "code": "M",
                  "display": "Married"
                }
              ],
              "text": "Getrouwd"
            },
            "multipleBirthBoolean": true,
            "contact": [
              {
                "relationship": [
                  {
                    "coding": [
                      {
                        "system":
                            "http://terminology.hl7.org/CodeSystem/v2-0131",
                        "code": "C"
                      }
                    ]
                  }
                ],
                "name": {
                  "use": "usual",
                  "family": patientRelationFamilyName,
                  "given": [patientRelation]
                },
                "telecom": [
                  {
                    "system": "phone",
                    "value": patientRelationPhone,
                    "use": "mobile"
                  }
                ]
              }
            ],
            "communication": [
              {
                "language": {
                  "coding": [
                    {
                      "system": "urn:ietf:bcp:47",
                      "code": countryCode,
                      "display": patientCommunication
                    }
                  ],
                  "text": patientCommunication
                },
                "preferred": true
              }
            ],
            "managingOrganization": {
              "reference": "Organization/$patientManagingOrganizationCode",
              // "Organization/f001",
              "display": patientManagingOrganization
            }
          },
        ),
      );
      warningLog(
          'checking for the response ${response.statusCode} and its body ${response.body}');

      final responseBody = json.decode(response.body);
      warningLog('$responseBody');
      final String fhirId = responseBody['id'];
      final String source = responseBody['meta']['source'];
      warningLog('Checking for Fhir Id $fhirId and source $source');
      final String? fhirPatientPhotoUrl =
          await app<StorageRepository>().entireUploadAndGetImageStringFhir(
        fhirId: fhirId,
        xfile: xFileFhir,
      );
      FhirPatientModel patientModel = FhirPatientModel(
        patientId: patientId,
        patientFhirId: fhirId,
        patientNam: patientName,
        patientFamilyName: patientFamilyName,
        patientPhone: patientPhone,
        patientGender: patientGender,
        patientAddressLine: patientAddressLine,
        patientAddressCity: patientAddressCity,
        patientAddressPostCode: patientAddressPostCode,
        patientAddressCountry: patientAddressCountry,
        patientRelation: patientRelation,
        patientRelationFamilyName: patientRelationFamilyName,
        patientRelationPhone: patientRelationPhone,
        patientRelationAddress: patientRelationAddress,
        patientRelationGender: patientRelationGender,
        patientCommunication: patientCommunication,
        patientGeneralPractitioner: patientGeneralPractitioner,
        patientManagingOrganization: patientManagingOrganization,
        patientLink: patientLink,
        patientSuffix: patientSuffix,
        patientEmail: patientEmail,
        patientDoB: patientDoB,
        countryCode: countryCode,
        patientManagingOrganizationCode: patientManagingOrganizationCode,
        deceased: deceased,
        photoUrl: fhirPatientPhotoUrl,
        source: source,
      );
      await addPatientDetailswithPatchedFHIRIdToDb(patient: patientModel);
      return patientModel;
    } catch (e) {
      throw FhirPatientErrorState(
        message: e.toString(),
      );
    }
  }

  Future<FhirPatientModel> addPatientDetailswithPatchedFHIRIdToDb(
      {required FhirPatientModel patient}) async {
    final url = Uri.parse(
        'https://fhirov-default-rtdb.asia-southeast1.firebasedatabase.app/FhirPatient.json');
    warningLog('Checking for FhirId ${patient.patientFhirId}');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "patientId": patient.patientId,
            "patientFhirId": patient.patientFhirId,
            "patientName": patient.patientNam,
            "patientFamilyName": patient.patientFamilyName,
            "patientPhone": patient.patientPhone,
            "patientGender": patient.patientGender,
            "patientAddressLine": patient.patientAddressLine,
            "patientAddressCity": patient.patientAddressCity,
            "patientAddressPostCode": patient.patientAddressPostCode,
            "patientAddressCountry": patient.patientAddressCountry,
            "patientRelation": patient.patientRelation,
            "patientRelationFamilyName": patient.patientRelationFamilyName,
            "patientRelationPhone": patient.patientRelationPhone,
            "patientRelationAddress": patient.patientRelationAddress,
            "patientRelationGender": patient.patientGender,
            "patientCommunication": patient.patientCommunication,
            "patientGeneralPractitioner": patient.patientGeneralPractitioner,
            "patientManagingOrganization": patient.patientManagingOrganization,
            "patientLink": patient.patientLink,
            "patientSuffix": patient.patientSuffix,
            "patientEmail": patient.patientEmail,
            "patientDoB": patient.patientDoB,
            "countryCode": patient.countryCode,
            "patientManagingOrganizationCode":
                patient.patientManagingOrganizationCode,
            "deceased": patient.deceased,
            "patientPhotoUrl": patient.photoUrl,
            "patientSource": patient.source,
          },
        ),
      );
      warningLog(
          'checking database stored object ${response.statusCode} and body ${response.body}');
      final responseBody = json.decode(response.body) as Map;
      warningLog('response Body $responseBody');
      return patient;
    } catch (e) {
      rethrow;
    }
  }
}
