// ignore_for_file: public_member_api_docs, sort_constructors_first
part of verfiy_forgot_code_view;

class _VerfiyForgotCodeMobile extends StatefulWidget {
  final dynamic verifyCode;
  const _VerfiyForgotCodeMobile({
    Key? key,
    required this.verifyCode,
  }) : super(key: key);

  @override
  State<_VerfiyForgotCodeMobile> createState() =>
      _VerfiyForgotCodeMobileState();
}

class _VerfiyForgotCodeMobileState extends State<_VerfiyForgotCodeMobile>
    with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
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

  void _showErrorDialog({required String message}) {
    showDialog(
      context: context,
      builder: (context) => CustomDialogBox(
        message: message,
      ),
    );
  }

  void _showSuccessDialog({required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        title: const Center(
          child: Text(
            'Verification',
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
                  const SetNewPasswordView(),
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

  submit() {
    if (int.tryParse(
          widget.verifyCode.toString(),
        ) ==
        int.tryParse(
          _emailController.text.trim().toString(),
        )) {
      _showSuccessDialog(message: "Successfully Verified");
    } else {
      _showErrorDialog(message: 'Incorrect Code');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.alphaBlend(const Color(0xffD99EC9), Colors.orange),
              Color.alphaBlend(Colors.pink, Colors.orange),
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
                  'Journey',
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
                color: Colors.white,
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
                        child: customText('Verify Code'),
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
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              filled: true,
                              labelText: 'Code',
                              prefixIcon: const Icon(
                                Icons.code,
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
  }
}
