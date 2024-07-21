part of fhir_appointment_list_view;

class _FhirAppointmentListMobile extends StatefulWidget {
  final FhirPatientModel fhirPatientModel;
  const _FhirAppointmentListMobile({required this.fhirPatientModel});

  @override
  State<_FhirAppointmentListMobile> createState() =>
      _FhirAppointmentListMobileState();
}

class _FhirAppointmentListMobileState extends State<_FhirAppointmentListMobile>
    with TickerProviderStateMixin {
  List<FhirAppointmentWidget> fhirAppointmentWidgetList = [];
  List<AppointmentModel> appointmentList = [];

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Starting offset
      end: Offset.zero, // Ending offset
    ).animate(_animationController);

    _animationController.forward(); // Start the animation
  }

  getCarePlanList() async {
    List<FhirAppointmentWidget> localAppointmentWidget = [];
    List<AppointmentModel> localAppointmentModels = [];
    // ignore: avoid_function_literals_in_foreach_calls
    localAppointmentModels = await app<FhirRepository>()
        .getAppointmentModelList(patientId: widget.fhirPatientModel.patientId);
    for (var appointmentModel in localAppointmentModels) {
      localAppointmentWidget.add(
        FhirAppointmentWidget(
          appointmentModel: appointmentModel,
        ),
      );
    }
    setState(() {
      fhirAppointmentWidgetList = localAppointmentWidget;
      appointmentList = localAppointmentModels;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        const SizedBox(
                          height: 30,
                        ),
                        customText2('FhirPat'),
                        SlideTransition(
                          position: _offsetAnimation,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                // Using RoundedRectangleBorder
                                Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.green, width: 4),
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      radius: 23,
                                    ),
                                    title: Text(
                                        'Name - ${widget.fhirPatientModel.patientNam}'),
                                    subtitle: Text(
                                        'Id-${widget.fhirPatientModel.patientId}'),
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
                        'Appointment List for Patient ${widget.fhirPatientModel.patientNam}-',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  fhirAppointmentWidgetList.isEmpty == true
                      ? const Center(
                          child: Text(
                          'No Apppointments found',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      : SingleChildScrollView(
                          child: Column(
                            children: fhirAppointmentWidgetList,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            app<NavigatorService>().buildAndPush(
              const AppointmentView(),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
