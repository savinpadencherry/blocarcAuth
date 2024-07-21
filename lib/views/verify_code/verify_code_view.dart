library verify_code_view;

import 'dart:async';

import 'package:fhirpat/core/contants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
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
=======
import 'package:journey/core/blocs/auth/auth_bloc.dart';
import 'package:journey/core/get.dart';
import 'package:journey/core/logger.dart';
import 'package:journey/core/repository/auth_repository.dart';
import 'package:journey/core/services/navigator_service.dart';
import 'package:journey/global/constants.dart';
import 'package:journey/theme/theme.dart';
import 'package:journey/views/home/home_view.dart';
import 'package:journey/views/onboarding/onboarding_view.dart';
import 'package:journey/views/phone_auth/phone_auth_view.dart';
import 'package:journey/widgets/custom_container.dart';
>>>>>>> e3e7d0c47203d58fefca22d2afa40087d4179bf6
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
