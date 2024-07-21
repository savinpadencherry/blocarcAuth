library phone_auth_view;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/views/login/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
<<<<<<< HEAD
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/verify_code/verify_code_view.dart';
import 'package:fhirpat/widgets/custom_container.dart';
import 'package:fhirpat/widgets/dialogbox.dart';
=======
import 'package:journey/core/logger.dart';
import 'package:journey/core/services/navigator_service.dart';
import 'package:journey/global/constants.dart';
import 'package:journey/theme/theme.dart';
import 'package:journey/views/verify_code/verify_code_view.dart';
import 'package:journey/widgets/custom_container.dart';
import 'package:journey/widgets/dialogbox.dart';
>>>>>>> e3e7d0c47203d58fefca22d2afa40087d4179bf6
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

import '../../core/blocs/auth/auth_bloc.dart';
import '../../core/get.dart';

part 'phone_auth_mobile.dart';
part 'phone_auth_tablet.dart';
part 'phone_auth_desktop.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _PhoneAuthMobile(),
        desktop: _PhoneAuthDesktop(),
        tablet: _PhoneAuthTablet(),
      );
    });
  }
}
