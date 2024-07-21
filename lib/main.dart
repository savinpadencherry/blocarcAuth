import 'package:fhirpat/core/blocs/fhirpat/fhirpat_bloc.dart';
import 'package:fhirpat/core/contants.dart';
import 'package:fhirpat/core/repository/fhirpat_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:fhirpat/core/blocs/auth/auth_bloc.dart';
import 'package:fhirpat/core/blocs/data/data_bloc.dart';
import 'package:fhirpat/core/repository/auth_repository.dart';
import 'package:fhirpat/core/repository/storage_repository.dart';
import 'package:fhirpat/theme/theme.dart';
import 'package:fhirpat/views/login/login_view.dart';
import 'package:fhirpat/views/signup/signup_view.dart';
import 'package:path_provider/path_provider.dart';
import 'core/get.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  initializeGetIt();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(
    const MainApplication(),
  );
}

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<StorageRepository>(
          create: (context) => StorageRepository(),
        ),
        RepositoryProvider<FhirRepository>(
          create: (context) => FhirRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(),
                storageRepository: context.read<StorageRepository>()),
          ),
          BlocProvider(
            create: (context) => DataBloc(
              storageRepository: context.read<StorageRepository>(),
            ),
          ),
          BlocProvider<FhirpatBloc>(
            create: (context) => FhirpatBloc(
              fhirRepository: context.read<FhirRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: app<NavigatorService>().navigatorKey,
          theme: ThemeData(
            fontFamily: GoogleFonts.bubblegumSans(
                    foreground: Paint()..shader = linearGradient)
                .fontFamily,
            colorScheme: ColorScheme.light(
              primary: ConstantVars.maintheme,
              secondary: ConstantVars.cardColorTheme,
            ),
          ),
          home: const LoginView(),
          routes: {
            '/SignUp': (context) => const SignupView(),
            '/SignIn': (context) => const LoginView(),
            // '/Home': (context) => const HomeView(),
          },
        ),
      ),
    );
  }
}
