// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_field, void_checks

part of login_view;

class _LoginMobile extends StatefulWidget {
  _LoginMobile();

  @override
  State<_LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<_LoginMobile>
    with TickerProviderStateMixin, LogMixin {
  late final AnimationController _animationController;
  late Animation<Size> _heightanimation;
  late Animation<Offset> _slideAnimation;
  String? email, password;
  final GlobalKey<FormState> _logInFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  late final AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool hasShownDialog = false;
  @override
  void initState() {
    context.read<AuthBloc>().add(OnAppStart());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _heightanimation = Tween<Size>(
      begin: const Size(100, 100),
      end: const Size(350, 350),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
    )..addListener(() {
        setState(() {});
      });
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: CupertinoColors.secondarySystemGroupedBackground,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
    _heightanimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _controller.forward();
      }
    });
    _slideAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
    _colorAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _showErrorSignUpDialog({String? message}) {
    showDialog(
        context: context,
        builder: (context) => CustomDialogBox(
              message: message,
            ));
  }

  _showErrorOnSignUp({String? httpException}) {
    var errorMessage = 'Authentication Error';
    if (httpException.toString().contains('EMAIL_EXISTS')) {
      //change keywords according to databasse
      errorMessage = 'This Email address is already in use';
    } else if (httpException.toString().contains('INVALID_EMAIL')) {
      //change keywords according to databasse
      errorMessage = 'Please try again with a valid Email address';
    } else if (httpException.toString().contains('WEAK_PASSWORD')) {
      //change keywords according to databasse
      errorMessage = 'Weak password';
    } else if (httpException.toString().contains('EMAIL_NOT_FOUND')) {
      errorMessage = 'Email Not Found';
    } else if (httpException.toString().contains('INVALID_PASSWORD')) {
      errorMessage = 'Wrong Password';
    } else if (httpException
        .toString()
        .contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
      errorMessage = 'Too many wrong attempts';
    }
    _showErrorSignUpDialog(message: errorMessage);
  }

  submit() {
    final form = _logInFormKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    context.read<AuthBloc>().add(
          LogInEvent(email: email!, password: password!),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // warningLog('$state');
        // if (hasShownDialog == true) {
        //   return;
        // } else {
        if (state is AuthErrorState) {
          // if (hasShownDialog == true) {
          _showErrorOnSignUp(httpException: state.message);
          setState(() {
            hasShownDialog = true;
          });
          // }
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     duration: Duration(seconds: 1),
          //     content: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         Expanded(child: Text(state.message)),
          //       ],
          //     ),
          //   ),
          // );
          // _showErrorOnSignUp(httpException: state.message);
        }
        if (state is AuthSuccess) {
          if (state.showOnBoarding == true) {
            app<NavigatorService>().buildAndPush(
              OnboardingView(
                email: state.email!,
                userId: state.userId!,
                documentId: state.documentID!,
              ),
            );
          }
          app<NavigatorService>().buildAndPush(
            HomeView(
              userId: state.userId,
              documentId: state.documentID,
              userOrPhone: state.email,
            ),
          );
        }
        // }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [Color(0xff356cf6), Color(0xff356cf6)],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'FhirPat',
                        speed: Duration(milliseconds: 350),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/Fhir.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                          height: state is AuthLoading
                              ? 400
                              : _heightanimation.value.height,
                          width: state is AuthLoading
                              ? 300
                              : _heightanimation.value.width,
                          decoration: BoxDecoration(
                            color: state is AuthLoading
                                ? Colors.blueAccent
                                : Color(0xff70aafe),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Form(
                            key: _logInFormKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  customText2('Log In'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 8.0),
                                    child: SlideTransition(
                                      position: _slideAnimation,
                                      child: TextFormField(
                                        autocorrect: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20.0,
                                              ),
                                              borderSide: BorderSide(
                                                  color: state is AuthLoading
                                                      ? Colors.white
                                                      : Colors.black)),
                                          filled: true,
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                            color: Color(0xff356cf6),
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.email,
                                            color: Color(0xff356cf6),
                                          ),
                                        ),
                                        validator: (String? value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Must Contain a email';
                                          }
                                          if (!isEmail(value.trim())) {
                                            return 'Enter a valid email';
                                          }
                                          if (value.contains('@gmail.com') ||
                                              value.contains(
                                                  '@protonmail.com') ||
                                              value.contains('@outlook.com') ||
                                              value.contains('@hotmail.com') ||
                                              value.contains('@yahoo.com') ||
                                              value.contains('@zoho.com') ||
                                              value.contains('@aol.com') ||
                                              value.contains('@aim.com') ||
                                              value.contains('@gmx.com') ||
                                              value.contains('@icloud.com') ||
                                              value.contains('@gmx.us') ||
                                              value.contains('@tutanota.com') ||
                                              value.contains('@tutamail.com')) {
                                            return null;
                                          } else {
                                            return 'Please try with an other email provider';
                                          }
                                        },
                                        onSaved: (String? value) {
                                          email = value;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 8.0),
                                    child: SlideTransition(
                                      position: _slideAnimation,
                                      child: TextFormField(
                                        autocorrect: false,
                                        controller: _passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                              color: state is AuthLoading
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          filled: true,
                                          labelText: 'password',
                                          labelStyle: TextStyle(
                                            color: Color(0xff356cf6),
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.lock,
                                            color: Color(0xff356cf6),
                                          ),
                                        ),
                                        validator: (String? value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return "Password cant be null";
                                          }
                                          if (value.trim().length < 6) {
                                            return "password must be atleast 6 characters";
                                          }
                                          return null;
                                        },
                                        onSaved: (String? value) {
                                          password = value;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SlideTransition(
                                    position: _slideAnimation,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.bounceInOut,
                                      height: state is AuthLoading ? 55 : 45,
                                      width: state is AuthLoading ? 165 : 160,
                                      child: GestureDetector(
                                        onTap: submit,
                                        child: CustomContainer(
                                          title: state is AuthLoading
                                              ? 'Authenticating'
                                              : 'Log In',
                                          icon: Icons.login,
                                          height: 20,
                                          width: 20,
                                          showShadow: false,
                                          textSize: 15,
                                          color: Colors.black,
                                          textColor: Colors.black,
                                          // style: ButtonStyle(
                                          //   shape: MaterialStateProperty.all(
                                          //     RoundedRectangleBorder(
                                          //       borderRadius:
                                          //           BorderRadius.circular(20),
                                          //     ),
                                          //   ),
                                          //   backgroundColor: state is AuthLoading
                                          //       ? MaterialStateProperty.all(
                                          //           Colors.white,
                                          //         )
                                          //       : MaterialStateProperty.all(
                                          //           Colors.deepOrange,
                                          //         ),
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        app<NavigatorService>().buildAndPush(
                                      ForgotPasswordView(),
                                    ),
                                    child: customText2('Forgot Password?'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '--------------- Or Login via ---------------',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 20),
                          child: GestureDetector(
                              onTap: () => app<NavigatorService>().buildAndPush(
                                    SignupView(),
                                  ),
                              child: CustomContainerIcon(
                                title: 'Sign Up',
                                color: Colors.purple,
                                icon: FontAwesomeIcons.arrowRightToBracket,
                                showShadow: false,
                                height: 50,
                                width: 50,
                                textColor: Colors.black,
                                textSize: 20,
                              )
                              // RichText(
                              //   text: TextSpan(
                              //     text: 'Log in via phone Number ',
                              //     style: const TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black,
                              //       fontSize: 15,
                              //     ),
                              //     children: [
                              //       TextSpan(
                              //         text: 'Click here',
                              //         style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           color: Theme.of(context)
                              //               .colorScheme
                              //               .secondary,
                              //           fontSize: 15,
                              //           decoration: TextDecoration.underline,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(GoogleSignInEvent());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CustomContainerIcon(
                              title: state is GoogleSignInLoadingState
                                  ? 'Signing In...'
                                  : 'Sign in with Google',
                              icon: state is GoogleSignInLoadingState
                                  ? FontAwesomeIcons.circle
                                  : FontAwesomeIcons.google,
                              height: 50,
                              width: 50,
                              showShadow: false,
                              textSize: 20,
                              color: Colors.orange,
                              textColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 20),
                          child: GestureDetector(
                              onTap: () => app<NavigatorService>().buildAndPush(
                                    PhoneAuthView(),
                                  ),
                              child: CustomContainerIcon(
                                title: 'Sign in with Phone',
                                color: Colors.green,
                                textColor: Colors.black,
                                icon: Icons.phone,
                                showShadow: false,
                                height: 50,
                                width: 50,
                                textSize: 20,
                              )
                              // RichText(
                              //   text: TextSpan(
                              //     text: 'Log in via phone Number ',
                              //     style: const TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black,
                              //       fontSize: 15,
                              //     ),
                              //     children: [

                              //       TextSpan(
                              //         text: 'Click here',
                              //         style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           color: Theme.of(context)
                              //               .colorScheme
                              //               .secondary,
                              //           fontSize: 15,
                              //           decoration: TextDecoration.underline,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
