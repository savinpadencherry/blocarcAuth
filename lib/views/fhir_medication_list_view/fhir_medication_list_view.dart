library fhir_medication_list_view;

import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/medication_request_model.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/medication_request/medication_request_view.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';
import 'package:fhirpat/widgets/fhir_medication_request_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
part 'fhir_medication_list_mobile.dart';
part 'fhir_medication_list_tablet.dart';
part 'fhir_medication_list_desktop.dart';

class FhirMedicationListView extends StatelessWidget {
  final FhirPatientModel fhirPatientModel;
  const FhirMedicationListView({super.key, required this.fhirPatientModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirMedicationListMobile(
          patientModel: fhirPatientModel,
        ),
        desktop: const _FhirMedicationListDesktop(),
        tablet: const _FhirMedicationListTablet(),
      );
    });
  }
}
