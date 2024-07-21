// ignore_for_file: public_member_api_docs, sort_constructors_first
library fhir_medication_administration_view;

import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:fhirpat/core/models/medication_administration_model.dart';

part 'fhir_medication_administration_desktop.dart';
part 'fhir_medication_administration_mobile.dart';
part 'fhir_medication_administration_tablet.dart';

class FhirMedicationAdministrationView extends StatelessWidget {
  final MedicationAdministrationModel medicationAdministrationModel;
  const FhirMedicationAdministrationView({
    Key? key,
    required this.medicationAdministrationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirMedicationAdministrationMobile(
          medicationAdministrationModel: medicationAdministrationModel,
        ),
        desktop: const _FhirMedicationAdministrationDesktop(),
        tablet: const _FhirMedicationAdministrationTablet(),
      );
    });
  }
}
