// ignore_for_file: public_member_api_docs, sort_constructors_first
library fhir_medication_request_view;

import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:fhirpat/core/models/medication_request_model.dart';

part 'fhir_medication_request_desktop.dart';
part 'fhir_medication_request_mobile.dart';
part 'fhir_medication_request_tablet.dart';

class FhirMedicationRequestView extends StatelessWidget {
  final MedicationRequestModel medicationRequestModel;
  const FhirMedicationRequestView({
    Key? key,
    required this.medicationRequestModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirMedicationRequestMobile(
          medicationRequestModel: medicationRequestModel,
        ),
        desktop: const _FhirMedicationRequestDesktop(),
        tablet: const _FhirMedicationRequestTablet(),
      );
    });
  }
}
