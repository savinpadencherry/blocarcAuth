// ignore_for_file: use_key_in_widget_constructors

library splash_view;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journey/core/blocs/auth/auth_bloc.dart';
import 'package:journey/core/get.dart';
import 'package:journey/core/logger.dart';
import 'package:journey/core/services/navigator_service.dart';
import 'package:journey/views/home/home_view.dart';
import 'package:journey/views/login/login_view.dart';
import 'package:journey/views/signup/signup_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'splash_mobile.dart';
part 'splash_tablet.dart';
part 'splash_desktop.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _SplashMobile(),
        desktop: _SplashDesktop(),
        tablet: _SplashTablet(),
      );
    });
  }
}
