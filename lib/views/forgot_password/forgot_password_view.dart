library forgot_password_view;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fhirpat/core/contants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fhirpat/core/blocs/auth/auth_bloc.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/send_reset_password/send_reset_password_view.dart';
import 'package:fhirpat/views/verfiy_forgot_code/verfiy_forgot_code_view.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../core/services/navigator_service.dart';

part 'forgot_password_mobile.dart';
part 'forgot_password_tablet.dart';
part 'forgot_password_desktop.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _ForgotPasswordMobile(),
        desktop: const _ForgotPasswordDesktop(),
        tablet: const _ForgotPasswordTablet(),
      );
    });
  }
}
