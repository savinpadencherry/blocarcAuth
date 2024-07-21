library patient_form_view;

import 'dart:io';

import 'package:fhirpat/core/blocs/fhirpat/fhirpat_bloc.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:fhirpat/widgets/customtexfields.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'patient_form_mobile.dart';
part 'patient_form_tablet.dart';
part 'patient_form_desktop.dart';

class PatientFormView extends StatelessWidget {
  const PatientFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _PatientFormMobile(),
        desktop: const _PatientFormDesktop(),
        tablet: const _PatientFormTablet(),
      );
    });
  }
}
