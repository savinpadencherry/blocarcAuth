// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, prefer_final_fields
// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

part of home_view;

class _HomeMobile extends StatefulWidget {
  final String? userId;
  final String? emailorPhone;
  final String? documentId;
  _HomeMobile({
    Key? key,
    required this.userId,
    required this.emailorPhone,
    required this.documentId,
  }) : super(key: key);

  @override
  State<_HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<_HomeMobile>
    with LogMixin, TickerProviderStateMixin {
  String? userName;
  String? emailorPhone;
  String? uid;
  String? imageUrl;
  late Animation<Offset> offsetAnimation;
  late AnimationController _controller;
  List<FhirPatientModel> patientModels = [];
  List<FhirPatientWidget> patientWidgets = [];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;

  getPatients() async {
    List<FhirPatientModel> patModels = [];
    List<FhirPatientWidget> patWidgets = [];
    patModels = await app<FhirRepository>().getPatientList();
    for (var element in patModels) {
      patWidgets.add(
        FhirPatientWidget(fhirPatientModel: element),
      );
    }
    setState(() {
      patientWidgets = patWidgets;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    offsetAnimation =
        Tween<Offset>(begin: Offset(-1.5, -3), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
    );
    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();
    });
    getPatients();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ShadowedContainer(
                        // height: 250,
                        // decoration: BoxDecoration(
                        //   color: ConstantVars.maintheme,
                        //   borderRadius: BorderRadius.only(
                        //     bottomRight: Radius.circular(25),
                        //     bottomLeft: Radius.circular(25),
                        //   ),
                        // ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            customText2('FhirPat'),
                            SlideTransition(
                              position: offsetAnimation,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    // Using RoundedRectangleBorder
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.green, width: 4),
                                        borderRadius: BorderRadius.circular(
                                          15,
                                        ),
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 23,
                                        ),
                                        title: Text('${widget.emailorPhone}'),
                                        subtitle: Text('Id-${widget.userId}'),
                                        // trailing: Icon(Icons.play_arrow, size: 30),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Patient List-',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ...patientWidgets
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ConstantVars.maintheme,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      elevation: 8, // Add a subtle shadow
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Choose an Option',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                app<NavigatorService>().buildAndPush(
                                  PatientFormView(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text('Create patient resource'),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                app<NavigatorService>().buildAndPush(
                                  ObservationView(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text('Create observation resource'),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                app<NavigatorService>().buildAndPush(
                                  CarePlanView(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text('Create Care Plan resource'),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Handle "Cancel" action
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red, // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            // bottomNavigationBar:
            //  CurvedNavigationBar(
            //   key: _bottomNavigationKey,
            //   items: <Widget>[
            //     Icon(Icons.add, size: 30),
            //     Icon(Icons.list, size: 30),
            //     Icon(Icons.compare_arrows, size: 30),
            //   ],
            //   onTap: (index) {
            //     setState(() {
            //       _page = index;
            //     });
            //   },
            // ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
