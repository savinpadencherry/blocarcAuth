library fhir_claim_list_view;

import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/claimmodel.dart';
import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/claim/claim_view.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';
import 'package:fhirpat/widgets/fhir_claim_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'fhir_claim_list_mobile.dart';
part 'fhir_claim_list_tablet.dart';
part 'fhir_claim_list_desktop.dart';

class FhirClaimListView extends StatelessWidget {
  final FhirPatientModel fhirPatientModel;
  const FhirClaimListView({super.key, required this.fhirPatientModel});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _FhirClaimListMobile(
          fhirPatientModel: fhirPatientModel,
        ),
        desktop: const _FhirClaimListDesktop(),
        tablet: const _FhirClaimListTablet(),
      );
    });
  }
}
