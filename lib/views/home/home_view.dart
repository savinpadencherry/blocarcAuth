// ignore_for_file: public_member_api_docs, sort_constructors_first
library home_view;

import 'package:fhirpat/core/models/patient_model.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:fhirpat/views/care_plan/care_plan_view.dart';
import 'package:fhirpat/views/observation/observation_view.dart';
import 'package:fhirpat/views/patient_form/patient_form_view.dart';
import 'package:fhirpat/widgets/fhirpat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/login/login_view.dart';
import 'package:fhirpat/widgets/animatedcustomcontainer.dart';

import '../../core/blocs/auth/auth_bloc.dart';

part 'home_desktop.dart';
part 'home_mobile.dart';
part 'home_tablet.dart';

class HomeView extends StatelessWidget {
  final String? userId;
  final String? documentId;
  final String? userOrPhone;
  const HomeView({
    Key? key,
    required this.userId,
    required this.documentId,
    required this.userOrPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _HomeMobile(
          userId: userId,
          documentId: documentId,
          emailorPhone: userOrPhone,
        ),
        desktop: _HomeDesktop(),
        tablet: _HomeTablet(),
      );
    });
  }
}
