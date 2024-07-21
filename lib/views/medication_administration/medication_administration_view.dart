library medication_administration_view;

import 'package:fhirpat/core/blocs/fhirpat/fhirpat_bloc.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:fhirpat/widgets/customtexfields.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'medication_administration_mobile.dart';
part 'medication_administration_tablet.dart';
part 'medication_administration_desktop.dart';

class MedicationAdministrationView extends StatelessWidget {
  const MedicationAdministrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _MedicationAdministrationMobile(),
        desktop: const _MedicationAdministrationDesktop(),
        tablet: const _MedicationAdministrationTablet(),
      );
    });
  }
}
