// ignore_for_file: public_member_api_docs, sort_constructors_first
library onboarding_view;

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:journey/theme/theme.dart';
import 'package:journey/views/home/home_view.dart';
import 'package:journey/views/login/login_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:journey/core/blocs/auth/auth_bloc.dart';
import 'package:journey/core/get.dart';
import 'package:journey/core/logger.dart';
import 'package:journey/core/repository/storage_repository.dart';
import 'package:journey/core/services/navigator_service.dart';

part 'onboarding_desktop.dart';
part 'onboarding_mobile.dart';
part 'onboarding_tablet.dart';

class OnboardingView extends StatelessWidget {
  final String email;
  final String userId;
  final String documentId;
  const OnboardingView({
    Key? key,
    required this.email,
    required this.userId,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _OnboardingMobile(
          email: email,
          userId: userId,
          documentId: documentId,
        ),
        desktop: _OnboardingDesktop(),
        tablet: _OnboardingTablet(),
      );
    });
  }
}
