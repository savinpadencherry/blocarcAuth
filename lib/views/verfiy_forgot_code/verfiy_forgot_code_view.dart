// ignore_for_file: public_member_api_docs, sort_constructors_first
library verfiy_forgot_code_view;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/views/set_new_password/set_new_password_view.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:fhirpat/theme/theme.dart';

import '../../core/services/navigator_service.dart';
import '../../widgets/custom_container.dart';

part 'verfiy_forgot_code_desktop.dart';
part 'verfiy_forgot_code_mobile.dart';
part 'verfiy_forgot_code_tablet.dart';

class VerfiyForgotCodeView extends StatelessWidget {
  final dynamic verifyCode;
  const VerfiyForgotCodeView({
    Key? key,
    required this.verifyCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _VerfiyForgotCodeMobile(
          verifyCode: verifyCode,
        ),
        desktop: const _VerfiyForgotCodeDesktop(),
        tablet: const _VerfiyForgotCodeTablet(),
      );
    });
  }
}
