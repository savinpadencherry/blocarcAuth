part of diagnostic_report_view;

class _DiagnosticReportMobile extends StatefulWidget {
  const _DiagnosticReportMobile();

  @override
  State<_DiagnosticReportMobile> createState() =>
      _DiagnosticReportMobileState();
}

class _DiagnosticReportMobileState extends State<_DiagnosticReportMobile>
    with LogMixin {
  TextEditingController diagonisticReportId = TextEditingController();
  TextEditingController diagonisticReportStudyType = TextEditingController();
  TextEditingController diagonisticReportStudyId = TextEditingController();
  TextEditingController diagonisticReportStatus = TextEditingController();
  TextEditingController patientId = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController categoryCode = TextEditingController();
  TextEditingController categoryDisplay = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController typeOfDiagnosticTestCode = TextEditingController();
  TextEditingController typeOfDiagnosticTestDisplay = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController organizationId = TextEditingController();
  TextEditingController organizationName = TextEditingController();
  TextEditingController conclusion = TextEditingController();
  TextEditingController conclusionCode = TextEditingController();
  TextEditingController conclusionDisplay = TextEditingController();
  TextEditingController effectiveDateTime = TextEditingController();
  TextEditingController issued = TextEditingController();

  bool hasEmptyController() {
    final controllers = [
      diagonisticReportId,
      diagonisticReportStudyType,
      diagonisticReportStudyId,
      diagonisticReportStatus,
      patientId,
      description,
      categoryCode,
      categoryDisplay,
      status,
      typeOfDiagnosticTestCode,
      typeOfDiagnosticTestDisplay,
      patientName,
      organizationId,
      organizationName,
      conclusion,
      conclusionCode,
      conclusionDisplay,
      effectiveDateTime,
      issued
    ];
    final emptyControllers =
        controllers.where((element) => element.text.isEmpty).toList();
    for (var element in emptyControllers) {
      warningLog(element.runtimeType.toString());
    }
    return controllers.any(
      (controller) => controller.text.isEmpty,
    );
  }

  showEmptyFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Empty Fields'),
          content: const Text('Please fill in all required fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  showErrorDialog(BuildContext context, String errorMessa) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialogBox(
            message: errorMessa,
          );
        });
  }

  submitDiagnosticReport() {
    if (hasEmptyController()) {
      showEmptyFieldDialog(context);
    }
    context.read<FhirpatBloc>().add(
          FhirCreateDiagnosticReportEvent(
            diagonisticReportId: diagonisticReportId.text,
            diagonisticReportStudyType: diagonisticReportStudyType.text,
            diagonisticReportStudyId: diagonisticReportStudyId.text,
            diagonisticReportStatus: diagonisticReportStatus.text,
            patientId: patientId.text,
            description: description.text,
            categoryCode: categoryCode.text,
            categoryDisplay: categoryDisplay.text,
            status: status.text,
            typeOfDiagnosticTestCode: typeOfDiagnosticTestCode.text,
            typeOfDiagnosticTestDisplay: typeOfDiagnosticTestDisplay.text,
            patientName: patientName.text,
            organizationId: organizationId.text,
            organizationName: organizationName.text,
            conclusion: conclusion.text,
            conclusionCode: conclusionCode.text,
            conclusionDisplay: conclusionDisplay.text,
            effectiveDateTime: effectiveDateTime.text,
            issued: issued.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FhirpatBloc, FhirpatState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text('Diagnostic Report form'),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: ConstantVars.cardColorTheme,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AnimatedTextField(
                              label: 'label',
                              controller: diagonisticReportId,
                            ),
                            AnimatedTextField(
                              label: 'Study Type',
                              controller: diagonisticReportStudyType,
                            ),
                            AnimatedTextField(
                              label: 'Study Id',
                              controller: diagonisticReportStudyId,
                            ),
                            AnimatedTextField(
                              label: 'Report Status',
                              controller: diagonisticReportStatus,
                            ),
                            AnimatedTextField(
                              label: 'Patient Id',
                              controller: patientId,
                            ),
                            AnimatedTextField(
                              label: 'Patient Name',
                              controller: patientName,
                            ),
                            AnimatedTextField(
                              label: 'Description',
                              controller: description,
                            ),
                            AnimatedTextField(
                              label: 'Category Code',
                              controller: categoryCode,
                            ),
                            AnimatedTextField(
                              label: 'Category Display',
                              controller: categoryDisplay,
                            ),
                            AnimatedTextField(
                              label: 'Status',
                              controller: status,
                            ),
                            AnimatedTextField(
                              label: 'Type of Diagnostic Test Code',
                              controller: typeOfDiagnosticTestDisplay,
                            ),
                            AnimatedTextField(
                              label: 'Organization Id',
                              controller: organizationId,
                            ),
                            AnimatedTextField(
                              label: 'Organization Name',
                              controller: organizationName,
                            ),
                            AnimatedTextField(
                              label: 'Conclusion',
                              controller: conclusion,
                            ),
                            AnimatedTextField(
                              label: 'Conclusion Code',
                              controller: conclusionCode,
                            ),
                            AnimatedTextField(
                              label: 'Conclusion Display',
                              controller: conclusionDisplay,
                            ),
                            AnimatedTextField(
                              label: 'Effective Date Time',
                              controller: effectiveDateTime,
                            ),
                            AnimatedTextField(
                              label: 'Issued',
                              controller: issued,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: submitDiagnosticReport,
                  child: CustomContainer3(
                    title: state is FhirCreateDiagnosticReportLoadingState
                        ? "Submitting"
                        : 'Submit',
                    color: Colors.blue,
                    icon: Icons.add_card,
                    showShadow: false,
                    height: 45,
                    width: 165,
                    textColor: Colors.black,
                    textSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
