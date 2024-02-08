// ignore_for_file: public_member_api_docs, sort_constructors_first
library send_reset_password_view;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:journey/core/get.dart';
import 'package:journey/core/services/navigator_service.dart';
import 'package:journey/global/constants.dart';
import 'package:journey/theme/theme.dart';
import 'package:journey/views/login/login_view.dart';
import 'package:journey/widgets/custom_container.dart';
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
