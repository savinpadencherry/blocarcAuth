// ignore_for_file: public_member_api_docs, sort_constructors_first
library fhir_care_plan_list_view;

import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/careplan.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/care_plan/care_plan_view.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';
import 'package:fhirpat/widgets/fhir_care_plan_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:fhirpat/core/models/patient_model.dart';

part 'fhir_care_plan_list_desktop.dart';
part 'fhir_care_plan_list_mobile.dart';
part 'fhir_care_plan_list_tablet.dart';

class FhirCarePlanListView extends StatelessWidget {
  final FhirPatientModel fhirPatientModel;
  const FhirCarePlanListView({
    Key? key,
    required this.fhirPatientModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirCarePlanListMobile(
          patientModel: fhirPatientModel,
        ),
        desktop: const _FhirCarePlanListDesktop(),
        tablet: const _FhirCarePlanListTablet(),
      );
    });
  }
}
