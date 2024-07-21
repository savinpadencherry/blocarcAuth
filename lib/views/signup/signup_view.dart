library signup_view;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/views/home/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:fhirpat/core/blocs/auth/auth_bloc.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/repository/auth_repository.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/login/login_view.dart';
import 'package:fhirpat/views/phone_auth/phone_auth_view.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
=======
import 'package:journey/core/blocs/auth/auth_bloc.dart';
import 'package:journey/core/get.dart';
import 'package:journey/core/logger.dart';
import 'package:journey/core/repository/auth_repository.dart';
import 'package:journey/core/services/navigator_service.dart';
import 'package:journey/global/constants.dart';
import 'package:journey/theme/theme.dart';
import 'package:journey/views/login/login_view.dart';
import 'package:journey/views/onboarding/onboarding_view.dart';
import 'package:journey/views/phone_auth/phone_auth_view.dart';
import 'package:journey/widgets/custom_container.dart';
import 'package:journey/widgets/dialogbox.dart';
>>>>>>> e3e7d0c47203d58fefca22d2afa40087d4179bf6
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

part 'signup_mobile.dart';
part 'signup_tablet.dart';
part 'signup_desktop.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _SignupMobile(),
        desktop: _SignupDesktop(),
        tablet: _SignupTablet(),
      );
    });
  }
}
