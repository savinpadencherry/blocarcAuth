part of forgot_password_view;

class _ForgotPasswordMobile extends StatefulWidget {
  const _ForgotPasswordMobile();

  @override
  State<_ForgotPasswordMobile> createState() => _ForgotPasswordMobileState();
}

class _ForgotPasswordMobileState extends State<_ForgotPasswordMobile>
    with TickerProviderStateMixin, LogMixin {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.5, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    )..addListener(() {
            setState(() {});
          });
    _controller.forward();
    _slideAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
    super.initState();
  }

  submit() {
    final form = _formKey.currentState;
    if (form == null && !form!.validate()) return;
    form.save();
    context.read<AuthBloc>().add(
          NewForgotPasswordEvent(email: _emailController.text),
        );
  }

  void _showDialog({required String message}) {
    showDialog(
      context: context,
      builder: (context) => CustomDialogBox(
        message: message,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        warningLog('Checking for state in forgot password $state');
        if (state is ForgotPasswordErrorState) {
          _showDialog(message: 'No email found');
        }
        if (state is ForgotPasswordSuccessState) {
          app<NavigatorService>().buildAndPush(
            VerfiyForgotCodeView(
              verifyCode: state.verifyCode,
            ),
          );
        }
        if (state is NewForgotPasswordSuccessState) {
          app<NavigatorService>().buildAndPush(
            SendResetPasswordView(email: state.email),
          );
        }
        if (state is NewForgotPasswordErrorState) {
          // if (state.message.toString().contains('no user record') == true) {
          //   _showDialog(message: 'No user record');
          //   context.read<AuthBloc>().add(
          //         ResetAuthEvent(),
          //       );
          // }
          _showDialog(message: "No user record found");
          context.read<AuthBloc>().add(ResetAuthEvent());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ConstantVars.maintheme,
                  ConstantVars.secondaryTheme,
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'fhirpat',
                      speed: const Duration(milliseconds: 350),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                    color: ConstantVars.cardColorTheme,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: customText2('Forgot password'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (String? value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Must Contain a email';
                                  }
                                  if (!isEmail(value.trim())) {
                                    return 'Enter a valid email';
                                  }
                                  if (value.contains('@gmail.com') ||
                                      value.contains('@protonmail.com') ||
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
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: ConstantVars.maintheme,
                                  ),
                                  labelStyle: TextStyle(
                                    color: ConstantVars.maintheme,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SlideTransition(
                            position: _slideAnimation,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.bounceInOut,
                              height: 45,
                              width: 160,
                              child: GestureDetector(
                                onTap: submit,
                                child: Container(
                                  height: 60,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.grey),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xffF6F0C4),
                                        Colors.pink,
                                      ],
                                      stops: [0, 0],
                                      begin: FractionalOffset.bottomRight,
                                      end: FractionalOffset.topLeft,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      state is NewForgotPasswordLoadingState
                                          ? const SizedBox()
                                          : const Icon(
                                              Icons.email,
                                              color: Colors.white,
                                            ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      state is NewForgotPasswordLoadingState
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const Expanded(
                                              child: Text(
                                                'Send Email',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  // height: widget.textSize,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
