library care_plan_view;

import 'package:fhirpat/core/blocs/fhirpat/fhirpat_bloc.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:fhirpat/widgets/customtexfields.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'care_plan_mobile.dart';
part 'care_plan_tablet.dart';
part 'care_plan_desktop.dart';

class CarePlanView extends StatelessWidget {
  const CarePlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _CarePlanMobile(key),
        desktop: const _CarePlanDesktop(),
        tablet: const _CarePlanTablet(),
      );
    });
  }
}
