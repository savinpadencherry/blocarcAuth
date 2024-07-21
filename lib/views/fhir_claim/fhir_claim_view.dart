library fhir_claim_view;

import 'package:fhirpat/core/models/claimmodel.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/info_tile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_claim_mobile.dart';
part 'fhir_claim_tablet.dart';
part 'fhir_claim_desktop.dart';

class FhirClaimView extends StatelessWidget {
  final ClaimDataModel claimDataModel;
  const FhirClaimView({super.key, required this.claimDataModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirClaimMobile(
          claimDataModel: claimDataModel,
        ),
        desktop: const _FhirClaimDesktop(),
        tablet: const _FhirClaimTablet(),
      );
    });
  }
}
