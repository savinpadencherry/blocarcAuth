library fhir_search_patient_view;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_search_patient_mobile.dart';
part 'fhir_search_patient_tablet.dart';
part 'fhir_search_patient_desktop.dart';

class FhirSearchPatientView extends StatelessWidget {
  const FhirSearchPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _FhirSearchPatientMobile(),
        desktop: const _FhirSearchPatientDesktop(),
        tablet: const _FhirSearchPatientTablet(),
      );
    });
  }
}
