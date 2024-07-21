part of fhir_diagnostic_report_list_view;

class _FhirDiagnosticReportListMobile extends StatefulWidget {
  final FhirPatientModel diagnosticReportModel;

  const _FhirDiagnosticReportListMobile({required this.diagnosticReportModel});

  @override
  State<_FhirDiagnosticReportListMobile> createState() =>
      _FhirDiagnosticReportListMobileState();
}

class _FhirDiagnosticReportListMobileState
    extends State<_FhirDiagnosticReportListMobile>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  List<DiagnosticReportModel> diagnosticReportModels = [];
  List<DiagnosticReportWidget> diagnosticReportWidgets = [];

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
    getDiagnosticList();
    _animationController.forward(); // Start the animation
  }

  getDiagnosticList() async {
    List<DiagnosticReportModel> localModels = [];
    List<DiagnosticReportWidget> localWidgets = [];
    localModels = await app<FhirRepository>().getDiagonisticReportList(
      patientID: widget.diagnosticReportModel.patientId,
    );
    for (var element in localModels) {
      localWidgets.add(DiagnosticReportWidget(
        diagnosticReportModel: element,
      ));
    }
    setState(() {
      diagnosticReportModels = localModels;
      diagnosticReportWidgets = localWidgets;
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
                                        'Name - ${widget.diagnosticReportModel.patientNam}'),
                                    subtitle: Text(
                                        'Id-${widget.diagnosticReportModel.patientId}'),
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
                        'Observation List for Patient ${widget.diagnosticReportModel.patientNam}-',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  diagnosticReportWidgets.isEmpty == true
                      ? const Center(
                          child: Text(
                          'No Diagnostic Report Found',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      : SingleChildScrollView(
                          child: Column(
                            children: diagnosticReportWidgets,
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
              const DiagnosticReportView(),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
