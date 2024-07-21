// ignore_for_file: prefer_const_constructors_in_immutables

library fhir_observation_list_view;

import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/observation_model.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';
import 'package:fhirpat/widgets/observation_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_observation_list_mobile.dart';
part 'fhir_observation_list_tablet.dart';
part 'fhir_observation_list_desktop.dart';

class FhirObservationListView extends StatelessWidget {
  late final FhirPatientModel patientModel;
  FhirObservationListView({super.key, required FhirPatientModel patientModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirObservationListMobile(
          patientModel: patientModel,
        ),
        desktop: const _FhirObservationListDesktop(),
        tablet: const _FhirObservationListTablet(),
      );
    });
  }
}
