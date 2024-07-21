// ignore_for_file: public_member_api_docs, sort_constructors_first
library send_reset_password_view;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/login/login_view.dart';
import 'package:fhirpat/widgets/custom_container.dart';
=======
import 'package:journey/core/get.dart';
import 'package:journey/core/services/navigator_service.dart';
import 'package:journey/global/constants.dart';
import 'package:journey/theme/theme.dart';
import 'package:journey/views/login/login_view.dart';
import 'package:journey/widgets/custom_container.dart';
>>>>>>> e3e7d0c47203d58fefca22d2afa40087d4179bf6
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'send_reset_password_desktop.dart';
part 'send_reset_password_mobile.dart';
part 'send_reset_password_tablet.dart';

class SendResetPasswordView extends StatelessWidget {
  final String email;
  const SendResetPasswordView({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _SendResetPasswordMobile(key, email: email),
        desktop: const _SendResetPasswordDesktop(),
        tablet: const _SendResetPasswordTablet(),
      );
    });
  }
}
