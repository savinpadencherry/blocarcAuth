library fhir_appointment_list_view;

import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/appointmentmodel.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/appointment/appointment_view.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';
import 'package:fhirpat/widgets/appointmentwidget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_appointment_list_mobile.dart';
part 'fhir_appointment_list_tablet.dart';
part 'fhir_appointment_list_desktop.dart';

class FhirAppointmentListView extends StatelessWidget {
  final FhirPatientModel fhirPatientModel;
  const FhirAppointmentListView({super.key, required this.fhirPatientModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirAppointmentListMobile(
          fhirPatientModel: fhirPatientModel,
        ),
        desktop: const _FhirAppointmentListDesktop(),
        tablet: const _FhirAppointmentListTablet(),
      );
    });
  }
}
