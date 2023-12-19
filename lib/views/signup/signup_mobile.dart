// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_field, unused_element

part of signup_view;

class _SignupMobile extends StatefulWidget {
  _SignupMobile();

  @override
  State<_SignupMobile> createState() => _SignupMobileState();
}

class _SignupMobileState extends State<_SignupMobile>
    with TickerProviderStateMixin, LogMixin {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late AnimationController _textFieldsController;
  final TextEditingController _passwordController = TextEditingController();
  late Animation<Offset> _slideAnimation;
  Animation<Size>? _heightAnimation;
  Animation<Color?>? colorAnimation;
  String? email, password;
  bool hasShownSignUpDialog = false;
  bool hasShownSnackbar = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _textFieldsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.5, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
          parent: _textFieldsController, curve: Curves.linearToEaseOut),
    )..addListener(() {
            setState(() {});
          });
    _heightAnimation = Tween<Size>(
      begin: const Size(100, 100),
      end: const Size(350, 400),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });
    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.white)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
    _heightAnimation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _textFieldsController.forward();
      }
    });
    colorAnimation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
      }
    });
    _slideAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _textFieldsController.stop();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textFieldsController.dispose();
    super.dispose();
  }

  void _showErrorSignUpDialog({String? message}) {
    showDialog(
      context: context,
      builder: (context) => CustomDialogBox(
        message: message,
      ),
    );
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
    }
    _showErrorSignUpDialog(message: errorMessage);
  }

  submit() {
    final form = _signUpFormKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    context.read<AuthBloc>().add(
          SignUpEvent(email: email!, password: password!),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        debugLog('$state');
        if (state is SignUpFailure) {
          hasShownSignUpDialog == true
              ? null
              : _showErrorOnSignUp(httpException: state.message);
          setState(() {
            hasShownSignUpDialog = true;
          });
        }
        if (state is AuthSuccess) {
          warningLog(
              'the state id ${state.documentID}, provider id is ${RepositoryProvider.of<AuthRepository>(context).documentId}');
          if (state.showOnBoarding == true) {
            app<NavigatorService>().buildAndPush(
              OnboardingView(
                email: state.email!,
                userId: state.userId!,
                documentId: state.documentID!,
              ),
            );
          }
        }
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
                  colors: const [
                    Color(0xffD99EC9),
                    Colors.pink,
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'Journey',
                        speed: Duration(milliseconds: 350),
                        textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ],
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
                              ? 390
                              : _heightAnimation?.value.height,
                          width: state is AuthLoading
                              ? 300
                              : _heightAnimation?.value.width,
                          decoration: BoxDecoration(
                            color: state is AuthLoading
                                ? Colors.orange
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Form(
                            key: _signUpFormKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  customText('Sign Up'),
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
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              20.0,
                                            ),
                                          ),
                                          filled: true,
                                          labelText: 'Email',
                                          prefixIcon: const Icon(
                                            Icons.email,
                                            color: Colors.black,
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
                                        obscureText: true,
                                        controller: _passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          filled: true,
                                          labelText: 'password',
                                          prefixIcon: const Icon(
                                            Icons.lock,
                                            color: Colors.black,
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
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 8.0),
                                    child: SlideTransition(
                                      position: _slideAnimation,
                                      child: TextFormField(
                                        autocorrect: false,
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          filled: true,
                                          labelText: 'Confirm password',
                                          prefixIcon: const Icon(
                                            Icons.lock,
                                            color: Colors.black,
                                          ),
                                        ),
                                        validator: (String? value) {
                                          if (_passwordController.text !=
                                              value) {
                                            return "Passwords dont match";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SlideTransition(
                                      position: _slideAnimation,
                                      child: GestureDetector(
                                        onTap: submit,
                                        child: CustomContainer(
                                          title: state is AuthLoading
                                              ? 'Signing In...'
                                              : 'Sign Up',
                                          textColor: Colors.black,
                                          icon: Icons.phone,
                                          showShadow: false,
                                          height: 50,
                                          width: 100,
                                          textSize: 20,
                                          color: Colors.green,
                                        ),
                                      )
                                      // AnimatedContainer(
                                      //   duration: Duration(milliseconds: 600),
                                      //   curve: Curves.bounceInOut,
                                      //   height: state is AuthLoading ? 50 : 45,
                                      //   width: state is AuthLoading ? 150 : 160,
                                      //   child: ElevatedButton(
                                      //     style: ButtonStyle(
                                      //       shape: MaterialStateProperty.all(
                                      //         RoundedRectangleBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(20),
                                      //         ),
                                      //       ),
                                      //       backgroundColor: state is AuthLoading
                                      //           ? MaterialStateProperty.all(
                                      //               Colors.white)
                                      //           : MaterialStateProperty.all(
                                      //               Colors.deepOrange),
                                      //     ),
                                      //     onPressed: submit,
                                      //     child: Text(
                                      //       'Sign Up',
                                      //       style: TextStyle(
                                      //           color: state is AuthLoading
                                      //               ? Colors.black
                                      //               : Colors.white),
                                      //     ),
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
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
                                    LoginView(),
                                  ),
                              child: CustomContainer2(
                                title: 'Log In',
                                color: Colors.purple,
                                icon: Icons.create,
                                showShadow: false,
                                height: 50,
                                width: 100,
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
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 20),
                          child: GestureDetector(
                              onTap: () => app<NavigatorService>().buildAndPush(
                                    PhoneAuthView(),
                                  ),
                              child: CustomContainer2(
                                title: 'Sign in with Phone',
                                color: Colors.green,
                                textColor: Colors.black,
                                icon: Icons.phone,
                                showShadow: false,
                                height: 50,
                                width: 100,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
