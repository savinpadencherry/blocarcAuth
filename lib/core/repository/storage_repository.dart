import 'dart:developer' as dev;
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fhirpat/core/blocs/auth/auth_bloc.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/repository/auth_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as im;

import '../get.dart';

class StorageRepository with LogMixin {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file;

  XFile? get image {
    return _file;
  }

  final storageRefUserProfile = FirebaseStorage.instance.ref();

  Future<XFile?> handlecameraOpening() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 70);
    dev.log('$image', name: 'StorageRepository');
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

  Future<File?> compressMedia({File? xfile, String? fhirId}) async {
    File file = File(xfile!.path);
    final tempdir = await getTemporaryDirectory();
    final path = tempdir.path;
    im.Image? imageFile = im.decodeImage(file.readAsBytesSync());
    final compressedMedia = File('$path/img_$fhirId.jpg')
      ..writeAsBytesSync(im.encodeJpg(imageFile!, quality: 85));
    return compressedMedia;
  }

  Future<String?> uploadMedia({File? file, String? fhirId}) async {
    final ref = storageRefUserProfile
        .child('FhirPatient_Images')
        .child('fhirId_$fhirId}');
    final TaskSnapshot task = await ref.putFile(file!);
    warningLog('${task.storage}');
    final String downloadUrl = await ref.getDownloadURL();
    warningLog(downloadUrl);
    return downloadUrl;
  }

  Future<String?> entireUploadAndGetImageStringFhir(
      {required String? fhirId, File? xfile}) async {
    try {
      final File? compressedFile =
          await compressMedia(xfile: xfile, fhirId: fhirId);
      final String? patientFhirImageURL =
          await uploadMedia(file: compressedFile, fhirId: fhirId);
      return patientFhirImageURL;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> entireUploadMediaFlowAndGettingFhirPatientImage(
      {File? xFile,
      String? fhirId,
      String? userNameL,
      String? email,
      required String documentId}) async {
    if (xFile == null) {
      try {
        warningLog('$userNameL');
        await app<AuthRepository>().patchUserNameAndPhotoUrl(
            userName: userNameL,
            photoUrl: '',
            emailId: email,
            userId: fhirId,
            documentID: documentId);
      } catch (e) {
        errorLog(e.toString());
        throw ErrorUploadingImageAndPatchingData(
          message: e.toString(),
        );
      }
    }
    try {
      warningLog('$userNameL');
      final File? compressedFile =
          await compressMedia(xfile: xFile, fhirId: fhirId);
      final String? patientFhirImageURL =
          await uploadMedia(file: compressedFile, fhirId: fhirId);
      return patientFhirImageURL;
    } catch (e) {
      errorLog(e.toString());
      throw ErrorUploadingImageAndPatchingData(
        message: e.toString(),
      );
    }
  }
}
