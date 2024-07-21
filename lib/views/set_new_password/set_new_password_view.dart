library set_new_password_view;

import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fhirpat/core/blocs/auth/auth_bloc.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/login/login_view.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:fhirpat/widgets/dialogbox.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import '../../core/get.dart';
import '../../core/services/navigator_service.dart';

part 'set_new_password_mobile.dart';
part 'set_new_password_tablet.dart';
part 'set_new_password_desktop.dart';

class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _SetNewPasswordMobile(),
        desktop: const _SetNewPasswordDesktop(),
        tablet: const _SetNewPasswordTablet(),
      );
    });
  }
}
