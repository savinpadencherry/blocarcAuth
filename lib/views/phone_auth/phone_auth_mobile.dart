// ignore_for_file: prefer_const_constructors, unused_local_variable

part of phone_auth_view;

class _PhoneAuthMobile extends StatefulWidget {
  const _PhoneAuthMobile();

  @override
  State<_PhoneAuthMobile> createState() => _PhoneAuthMobileState();
}

class _PhoneAuthMobileState extends State<_PhoneAuthMobile>
    with TickerProviderStateMixin, LogMixin {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  late AnimationController _animationController;
  late AnimationController _textFieldsController;
  late Animation<Offset> _slideAnimation;
  Animation<Size>? _heightAnimation;
  Animation<Color?>? colorAnimation;
  String? phoneNumber, password;
  bool hasShownSignUpDialog = false;
  bool hasShownSnackbar = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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
      end: const Size(350, 250),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
        ..addListener(() {
          setState(() {});
        }),
    );
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

  void _showErrorSignUpDialogPhone({String? message}) {
    showDialog(
        context: context,
        builder: (context) => CustomDialogBox(
              message: message,
            ));
  }

  _showErrorOnPhoneSignUp({String? httpException}) {
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
    } else if (httpException.toString().contains(
        'We have blocked all requests from this device due to unusual activity. Try again later.')) {
      errorMessage = "Unusual activity from Number";
    }
    _showErrorSignUpDialogPhone(message: httpException);
  }

  submit() {
    final form = _signUpFormKey.currentState;
    if (form == null || !form.validate()) return;
    form.save();
    context.read<AuthBloc>().add(
          PhoneAuthenticationEvent(phoneNumber: phoneNumber!),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        debugLog('$state');
        if (state is ErrorSendingCode) {
          _showErrorOnPhoneSignUp(httpException: state.message);
        }
        if (state is CodeSentToPhone) {
          app<NavigatorService>().buildAndPush(VerifyCodeView());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ConstantVars.maintheme, ConstantVars.maintheme],
              ),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
                height:
                    state is AuthLoading ? 300 : _heightAnimation?.value.height,
                width:
                    state is AuthLoading ? 300 : _heightAnimation?.value.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: state is AuthLoading
                      ? Colors.white54
                      : ConstantVars.cardColorTheme,
                ),
                child: Form(
                  key: _signUpFormKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        customText2('Sign Up'),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: IntlPhoneField(
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                log(phone.completeNumber);
                                phoneNumber = phone.completeNumber;
                              },
                            ),
                            // child: TextFormField(
                            //   autocorrect: false,
                            //   keyboardType: TextInputType.phone,
                            //   maxLength: 10,
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(15.0),
                            //     ),
                            //     filled: true,
                            //     labelText: 'Phone Number',
                            //     prefixIcon: const Icon(
                            //       Icons.email,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            //   validator: (String? value) {
                            //     if (value == null || value.trim().isEmpty) {
                            //       return 'Must Contain a PhoneNumber';
                            //     }
                            //     if (value.length < 10 || value.length > 10) {
                            //       return 'Length of phone number invalid';
                            //     }
                            //     return null;
                            //   },
                            //   onSaved: (String? value) {
                            //     phoneNumber = '+91value';
                            //   },
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: submit,
                          child: CustomContainer(
                            title: state is AuthLoading
                                ? 'Sending Code'
                                : 'Send Code',
                            icon: Icons.phone,
                            height: 50,
                            width: 140,
                            showShadow: false,
                            textSize: 20,
                            color: Colors.green,
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
