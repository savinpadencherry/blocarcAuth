part of fhir_medication_administration_list_view;

class _FhirMedicationAdministrationListMobile extends StatefulWidget {
  final FhirPatientModel patientModel;
  const _FhirMedicationAdministrationListMobile({required this.patientModel});

  @override
  State<_FhirMedicationAdministrationListMobile> createState() =>
      _FhirMedicationAdministrationListMobileState();
}

class _FhirMedicationAdministrationListMobileState
    extends State<_FhirMedicationAdministrationListMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  List<MedicationAdministrationModel> medicationAdministrationList = [];
  List<MedicationAdministrationWidget> medicationAdministrationWidgetList = [];

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
    getMedicationAdministrationList();
    _animationController.forward(); // Start the animation
  }

  getMedicationAdministrationList() async {
    List<MedicationAdministrationModel> localModels = [];
    List<MedicationAdministrationWidget> localWidgets = [];
    localModels = await app<FhirRepository>().getMedicationAdministrationList(
        patientID: widget.patientModel.patientId);
    for (var element in localModels) {
      localWidgets.add(MedicationAdministrationWidget(
        medicationAdministrationModel: element,
      ));
    }
    setState(() {
      medicationAdministrationList = localModels;
      medicationAdministrationWidgetList = localWidgets;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                  medicationAdministrationWidgetList.isEmpty == true
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
                            children: medicationAdministrationWidgetList,
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
              const MedicationAdministrationView(),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
