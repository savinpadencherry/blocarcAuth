library appointment_view;

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

part 'appointment_mobile.dart';
part 'appointment_tablet.dart';
part 'appointment_desktop.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _AppointmentMobile(),
        desktop: const _AppointmentDesktop(),
        tablet: const _AppointmentTablet(),
      );
    });
  }
}
