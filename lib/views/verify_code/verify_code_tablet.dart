// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

part of verify_code_view;

class _VerifyCodeTablet extends StatefulWidget {
  _VerifyCodeTablet();

  @override
  State<_VerifyCodeTablet> createState() => _VerifyCodeTabletState();
}

class _VerifyCodeTabletState extends State<_VerifyCodeTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('VerifyCodeTablet'),
      ),
    );
  }
}
