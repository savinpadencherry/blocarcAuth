// ignore_for_file: public_member_api_docs, sort_constructors_first
library fhir_medication_administration_list_view;

import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/views/medication_administration/medication_administration_view.dart';
import 'package:fhirpat/widgets/fhir_medication_administration_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:fhirpat/core/models/medication_administration_model.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';

part 'fhir_medication_administration_list_desktop.dart';
part 'fhir_medication_administration_list_mobile.dart';
part 'fhir_medication_administration_list_tablet.dart';

class FhirMedicationAdministrationListView extends StatelessWidget {
  final FhirPatientModel patientModel;
  const FhirMedicationAdministrationListView({
    Key? key,
    required this.patientModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirMedicationAdministrationListMobile(
          patientModel: patientModel,
        ),
        desktop: const _FhirMedicationAdministrationListDesktop(),
        tablet: const _FhirMedicationAdministrationListTablet(),
      );
    });
  }
}
