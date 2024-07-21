library diagnostic_report_view;

import 'package:fhirpat/core/blocs/fhirpat/fhirpat_bloc.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:fhirpat/widgets/customtexfields.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'diagnostic_report_mobile.dart';
part 'diagnostic_report_tablet.dart';
part 'diagnostic_report_desktop.dart';

class DiagnosticReportView extends StatelessWidget {
  const DiagnosticReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _DiagnosticReportMobile(),
        desktop: const _DiagnosticReportDesktop(),
        tablet: const _DiagnosticReportTablet(),
      );
    });
  }
}
