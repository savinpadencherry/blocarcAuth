library fhir_diagnostic_report_view;

import 'package:fhirpat/core/models/diagonisticreport.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_diagnostic_report_mobile.dart';
part 'fhir_diagnostic_report_tablet.dart';
part 'fhir_diagnostic_report_desktop.dart';

class FhirDiagnosticReportView extends StatelessWidget {
  final DiagnosticReportModel diagnosticReportModel;
  const FhirDiagnosticReportView(
      {super.key, required this.diagnosticReportModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirDiagnosticReportMobile(
          diagnosticReportModel: diagnosticReportModel,
        ),
        desktop: const _FhirDiagnosticReportDesktop(),
        tablet: const _FhirDiagnosticReportTablet(),
      );
    });
  }
}
