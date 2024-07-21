library fhir_appointment_view;

import 'package:fhirpat/core/models/appointmentmodel.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_appointment_mobile.dart';
part 'fhir_appointment_tablet.dart';
part 'fhir_appointment_desktop.dart';

class FhirAppointmentView extends StatelessWidget {
  final AppointmentModel appointmentModel;
  const FhirAppointmentView({super.key, required this.appointmentModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirAppointmentMobile(
          appointmentModel: appointmentModel,
        ),
        desktop: const _FhirAppointmentDesktop(),
        tablet: const _FhirAppointmentTablet(),
      );
    });
  }
}
