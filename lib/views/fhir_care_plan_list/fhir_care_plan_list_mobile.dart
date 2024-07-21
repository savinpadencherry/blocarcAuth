// ignore_for_file: public_member_api_docs, sort_constructors_first
part of fhir_care_plan_list_view;

class _FhirCarePlanListMobile extends StatefulWidget {
  final FhirPatientModel patientModel;
  const _FhirCarePlanListMobile({
    Key? key,
    required this.patientModel,
  }) : super(key: key);

  @override
  State<_FhirCarePlanListMobile> createState() =>
      _FhirCarePlanListMobileState();
}

class _FhirCarePlanListMobileState extends State<_FhirCarePlanListMobile>
    with TickerProviderStateMixin {
  List<FhirCarePlanWidget> fhirCarePlanWidgetList = [];
  List<CarePlanModel> carePlanModelList = [];

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
    List<FhirCarePlanWidget> localFhirCarePlanWidgetList = [];
    List<CarePlanModel> localCarePlanModelList = [];
    // ignore: avoid_function_literals_in_foreach_calls
    localCarePlanModelList = await app<FhirRepository>()
        .getCarePlanList(patientID: widget.patientModel.patientId);
    for (var carePlanModel in localCarePlanModelList) {
      localFhirCarePlanWidgetList.add(
        FhirCarePlanWidget(
          carePlanModel: carePlanModel,
        ),
      );
    }
    setState(() {
      fhirCarePlanWidgetList = localFhirCarePlanWidgetList;
      carePlanModelList = localCarePlanModelList;
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
                        'Care plan List for Patient ${widget.patientModel.patientNam}-',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  fhirCarePlanWidgetList.isEmpty == true
                      ? const Center(
                          child: Text(
                          'No Care plan found',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      : SingleChildScrollView(
                          child: Column(
                            children: fhirCarePlanWidgetList,
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
              const CarePlanView(),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
