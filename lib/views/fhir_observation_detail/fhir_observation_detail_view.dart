library fhir_observation_detail_view;

import 'package:fhirpat/core/models/observation_model.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_observation_detail_mobile.dart';
part 'fhir_observation_detail_tablet.dart';
part 'fhir_observation_detail_desktop.dart';

class FhirObservationDetailView extends StatelessWidget {
  final ObservationModel observationModel;
  const FhirObservationDetailView({super.key, required this.observationModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile:
            _FhirObservationDetailMobile(observationModel: observationModel),
        desktop: const _FhirObservationDetailDesktop(),
        tablet: const _FhirObservationDetailTablet(),
      );
    });
  }
}
