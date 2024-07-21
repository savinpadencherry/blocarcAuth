library fhir_diagnostic_report_list_view;

import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/diagonisticreport.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/diagnostic_report/diagnostic_report_view.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';
import 'package:fhirpat/widgets/diagnosticreportwidget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_diagnostic_report_list_mobile.dart';
part 'fhir_diagnostic_report_list_tablet.dart';
part 'fhir_diagnostic_report_list_desktop.dart';

class FhirDiagnosticReportListView extends StatelessWidget {
  final FhirPatientModel diagnosticReportModel;
  const FhirDiagnosticReportListView(
      {super.key, required this.diagnosticReportModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirDiagnosticReportListMobile(
          diagnosticReportModel: diagnosticReportModel,
        ),
        desktop: const _FhirDiagnosticReportListDesktop(),
        tablet: const _FhirDiagnosticReportListTablet(),
      );
    });
  }
}
