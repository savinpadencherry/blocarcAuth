part of fhir_medication_list_view;

class _FhirMedicationListMobile extends StatefulWidget {
  final FhirPatientModel patientModel;
  const _FhirMedicationListMobile({required this.patientModel});

  @override
  State<_FhirMedicationListMobile> createState() =>
      __FhirMedicationListMobileState();
}

class __FhirMedicationListMobileState extends State<_FhirMedicationListMobile>
    with TickerProviderStateMixin {
  List<MedicationRequestModel> finalmedicationList = [];
  List<FhirMedicationRequestWidget> finalMedicationRequesrWidgetList = [];
  late Animation<Offset> offsetAnimation;
  late AnimationController _controller;

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
    getMedicationList();
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  getMedicationList() async {
    List<MedicationRequestModel> localmedicationList = [];
    List<FhirMedicationRequestWidget> localMedicationRequesrWidgetList = [];
    localmedicationList = await app<FhirRepository>()
        .getMedicationList(patientID: widget.patientModel.patientId);
    for (var element in localmedicationList) {
      localMedicationRequesrWidgetList.add(
        FhirMedicationRequestWidget(
          medicationRequestModel: element,
        ),
      );
    }
    setState(() {
      finalmedicationList = localmedicationList;
      finalMedicationRequesrWidgetList = localMedicationRequesrWidgetList;
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
                  finalMedicationRequesrWidgetList.isEmpty == true
                      ? const Center(
                          child: Text(
                          'No Medcation Request Found',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      : SingleChildScrollView(
                          child: Column(
                            children: finalMedicationRequesrWidgetList,
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
              const MedicationRequestView(),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
