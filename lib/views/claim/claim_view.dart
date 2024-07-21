library claim_view;

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
part 'claim_mobile.dart';
part 'claim_tablet.dart';
part 'claim_desktop.dart';

class ClaimView extends StatelessWidget {
  const ClaimView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _ClaimMobile(),
        desktop: const _ClaimDesktop(),
        tablet: const _ClaimTablet(),
      );
    });
  }
}
