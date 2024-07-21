// ignore_for_file: public_member_api_docs, sort_constructors_first
library fhir_patient_detail_view;

import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:fhirpat/core/models/patient_model.dart';

part 'fhir_patient_detail_desktop.dart';
part 'fhir_patient_detail_mobile.dart';
part 'fhir_patient_detail_tablet.dart';

class FhirPatientDetailView extends StatelessWidget {
  final FhirPatientModel fhirPatientModel;
  const FhirPatientDetailView({
    Key? key,
    required this.fhirPatientModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile:
            _FhirPatientDetailMobile(fhirPatientModel: fhirPatientModel, key),
        desktop: const _FhirPatientDetailDesktop(),
        tablet: const _FhirPatientDetailTablet(),
      );
    });
  }
}
