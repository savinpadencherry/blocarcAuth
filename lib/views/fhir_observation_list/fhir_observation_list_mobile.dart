part of fhir_observation_list_view;

class _FhirObservationListMobile extends StatefulWidget {
  final FhirPatientModel patientModel;
  const _FhirObservationListMobile({required this.patientModel});

  @override
  State<_FhirObservationListMobile> createState() =>
      _FhirObservationListMobileState();
}

class _FhirObservationListMobileState extends State<_FhirObservationListMobile>
    with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController _controller;
  List<ObservationModel> finalobservationList = [];
  List<FhirObservationWidget> finalobservationWidgetList = [];
  // bool _hasObservation = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    offsetAnimation =
        Tween<Offset>(begin: const Offset(-1.5, -3), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut),
    );
    getObservationListFromFirebase();
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  getObservationListFromFirebase() async {
    List<ObservationModel> observationList = [];
    List<FhirObservationWidget> observationWidgetList = [];
    observationList = await app<FhirRepository>()
        .getObservationList(patientId: widget.patientModel.patientId);
    for (var element in observationList) {
      observationWidgetList.add(
        FhirObservationWidget(
          model: element,
        ),
      );
    }
    setState(() {
      finalobservationList = observationList;
      finalobservationWidgetList = observationWidgetList;
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
                          position: offsetAnimation,
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
                                        'Name - ${widget.patientModel.patientNam}'),
                                    subtitle: Text(
                                        'Id-${widget.patientModel.patientId}'),
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
                        'Observation List for Patient ${widget.patientModel.patientNam}-',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  finalobservationWidgetList.isEmpty == true
                      ? const Center(
                          child: Text(
                          'No Observation Found',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      : SingleChildScrollView(
                          child: Column(
                          children: finalobservationWidgetList,
                        )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
