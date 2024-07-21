// ignore_for_file: public_member_api_docs, sort_constructors_first
part of send_reset_password_view;

class _SendResetPasswordMobile extends StatefulWidget {
  final String email;
  const _SendResetPasswordMobile(Key? key, {required this.email})
      : super(key: key);

  @override
  State<_SendResetPasswordMobile> createState() =>
      _SendResetPasswordMobileState();
}

class _SendResetPasswordMobileState extends State<_SendResetPasswordMobile> {
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
              child: Column(
                children: [
                  Lottie.network(
                    'https://lottie.host/da4b1e82-0324-4752-9365-e064bc95a00e/F0DOw6qbPy.json',
                    height: 200,
                    width: 200,
                  ),
                  customText('Reset password email sent'),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () => app<NavigatorService>().buildAndPush(
                      const LoginView(),
                    ),
                    child: const CustomContainer2(
                      title: 'Done',
                      icon: Icons.done,
                      height: 50,
                      width: 120,
                      showShadow: false,
                      textSize: 20,
                      color: Colors.orange,
                      textColor: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
