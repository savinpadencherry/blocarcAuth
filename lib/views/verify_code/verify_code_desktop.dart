// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

part of verify_code_view;

class _VerifyCodeDesktop extends StatefulWidget {
  _VerifyCodeDesktop();

  @override
  State<_VerifyCodeDesktop> createState() => _VerifyCodeDesktopState();
}

class _VerifyCodeDesktopState extends State<_VerifyCodeDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('VerifyCodeDesktop'),
      ),
    );
  }
}
