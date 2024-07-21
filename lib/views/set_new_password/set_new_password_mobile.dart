// ignore_for_file: unnecessary_string_interpolations

part of set_new_password_view;

class _SetNewPasswordMobile extends StatefulWidget {
  const _SetNewPasswordMobile();

  @override
  State<_SetNewPasswordMobile> createState() => _SetNewPasswordMobileState();
}

class _SetNewPasswordMobileState extends State<_SetNewPasswordMobile>
    with TickerProviderStateMixin {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.5, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    )..addListener(() {
            setState(() {});
          });
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
  }

  void _showSuccessDialog({required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: const Center(
          child: Text(
            'Update Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 20),
        content: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(message),
              ),
              const SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () => app<NavigatorService>().buildAndPushReplacement(
                  const LoginView(),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog({required String message}) {
    showDialog(
      context: context,
      builder: (context) => CustomDialogBox(
        message: message,
      ),
    );
  }

  submit() {
    if (_confirmController.text.trim().toString() ==
        _newPasswordController.text.trim().toString()) {
      log('the password ${_confirmController.text.trim().toString()}',
          name: 'set_new_password_mobile.dart');
      context.read<AuthBloc>().add(
            ResetPasswordEvent(
              password: _confirmController.text.trim().toString(),
            ),
          );
    } else {
      _showErrorDialog(message: 'Passwords do NOT match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      log('listening to state $state', name: 'set_new_password_mobile.dart');
      if (state is ResetPasswordErrorState) {
        _showErrorDialog(
          message: state.message,
        );
      }
      if (state is ResetPasswordSuccessState) {
        _showSuccessDialog(message: state.message);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
<<<<<<< HEAD
              colors: [
                ConstantVars.maintheme,
                ConstantVars.secondaryTheme,
              ],
=======
              colors: [ConstantVars.maintheme, ConstantVars.maintheme],
>>>>>>> e3e7d0c47203d58fefca22d2afa40087d4179bf6
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
                height: 300,
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
                          child: customText('New Password'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: TextFormField(
                              controller: _newPasswordController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'New Password',
                                labelStyle:
                                    TextStyle(color: ConstantVars.maintheme),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: ConstantVars.maintheme,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: TextFormField(
                              controller: _confirmController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                labelText: 'Confirm Password',
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.black,
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
                              child: const CustomContainer(
                                title: 'Verify',
                                icon: Icons.email,
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
