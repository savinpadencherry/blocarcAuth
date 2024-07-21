library verify_code_view;

import 'dart:async';

import 'package:fhirpat/core/contants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fhirpat/core/blocs/auth/auth_bloc.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/repository/auth_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/home/home_view.dart';
import 'package:fhirpat/views/phone_auth/phone_auth_view.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
part 'verify_code_mobile.dart';
part 'verify_code_tablet.dart';
part 'verify_code_desktop.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _VerifyCodeMobile(),
        desktop: _VerifyCodeDesktop(),
        tablet: _VerifyCodeTablet(),
      );
    });
  }
}
