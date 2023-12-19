// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

part of home_view;

class _HomeMobile extends StatefulWidget {
  _HomeMobile();

  @override
  State<_HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<_HomeMobile> with LogMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        warningLog('$state');
        if (state is ClearHydrateState) {
          app<NavigatorService>().buildAndPush(
            LoginView(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  // child: Column(
                  //   children: [],
                  // ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
