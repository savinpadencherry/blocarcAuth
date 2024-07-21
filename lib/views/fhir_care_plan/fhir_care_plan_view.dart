// ignore_for_file: public_member_api_docs, sort_constructors_first
library fhir_care_plan_view;

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:fhirpat/core/models/careplan.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';

part 'fhir_care_plan_desktop.dart';
part 'fhir_care_plan_mobile.dart';
part 'fhir_care_plan_tablet.dart';

class FhirCarePlanView extends StatelessWidget {
  final CarePlanModel carePlanModel;
  const FhirCarePlanView({
    Key? key,
    required this.carePlanModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirCarePlanMobile(
          carePlanModel: carePlanModel,
        ),
        desktop: const _FhirCarePlanDesktop(),
        tablet: const _FhirCarePlanTablet(),
      );
    });
  }
}
