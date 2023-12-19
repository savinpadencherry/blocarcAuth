library home_view;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:journey/core/get.dart';
import 'package:journey/core/logger.dart';
import 'package:journey/core/services/navigator_service.dart';
import 'package:journey/views/login/login_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import '../../core/blocs/auth/auth_bloc.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _HomeMobile(),
        desktop: _HomeDesktop(),
        tablet: _HomeTablet(),
      );
    });
  }
}
