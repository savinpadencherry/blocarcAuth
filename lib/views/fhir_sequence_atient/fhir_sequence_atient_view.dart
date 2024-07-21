library fhir_sequence_atient_view;

import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/fhir_appointment_list/fhir_appointment_list_view.dart';
import 'package:fhirpat/views/fhir_care_plan_list/fhir_care_plan_list_view.dart';
import 'package:fhirpat/views/fhir_claim_list/fhir_claim_list_view.dart';
import 'package:fhirpat/views/fhir_diagnostic_report_list/fhir_diagnostic_report_list_view.dart';
import 'package:fhirpat/views/fhir_medication_administration_list/fhir_medication_administration_list_view.dart';
import 'package:fhirpat/views/fhir_medication_list_view/fhir_medication_list_view.dart';
import 'package:fhirpat/views/fhir_observation_list/fhir_observation_list_view.dart';
import 'package:fhirpat/views/fhir_patient_detail/fhir_patient_detail_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_sequence_atient_mobile.dart';
part 'fhir_sequence_atient_tablet.dart';
part 'fhir_sequence_atient_desktop.dart';

class FhirSequenceAtientView extends StatelessWidget {
  final FhirPatientModel fhirPatientModel;
  const FhirSequenceAtientView({super.key, required this.fhirPatientModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirSequenceAtientMobile(
          fhirPatientModel: fhirPatientModel,
        ),
        desktop: const _FhirSequenceAtientDesktop(),
        tablet: const _FhirSequenceAtientTablet(),
      );
    });
  }
}
