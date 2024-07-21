part of medication_administration_view;

class _MedicationAdministrationMobile extends StatefulWidget {
  const _MedicationAdministrationMobile();

  @override
  State<_MedicationAdministrationMobile> createState() =>
      _MedicationAdministrationMobileState();
}

class _MedicationAdministrationMobileState
    extends State<_MedicationAdministrationMobile> with LogMixin {
  TextEditingController medicationAdministrationId = TextEditingController();
  TextEditingController medicationId = TextEditingController();
  TextEditingController medicineCode = TextEditingController();
  TextEditingController medicineName = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController medicationReferenceRequestId = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController patientId = TextEditingController();
  TextEditingController encounterId = TextEditingController();
  TextEditingController encounterDisplay = TextEditingController();
  TextEditingController occurenceStartPeriod = TextEditingController();
  TextEditingController occurenceEndPeriod = TextEditingController();
  TextEditingController practitionerId = TextEditingController();
  TextEditingController practitionerName = TextEditingController();
  TextEditingController dosageText = TextEditingController();
  TextEditingController routeCode = TextEditingController();
  TextEditingController routeName = TextEditingController();
  late int doseValue;
  TextEditingController doseUnit = TextEditingController();
  TextEditingController doseCode = TextEditingController();
  late int rateRatioValue;
  TextEditingController rateRatioCode = TextEditingController();
  late int denominatorValue;
  TextEditingController denominatorCode = TextEditingController();
  TextEditingController medicationAdministrationFhirID =
      TextEditingController();
  TextEditingController source = TextEditingController();

  bool hasEmptyController() {
    final controllers = [
      medicationAdministrationId,
      medicationId,
      medicineCode,
      medicineName,
      status,
      medicationReferenceRequestId,
      patientName,
      patientId,
      encounterId,
      encounterDisplay,
      occurenceStartPeriod,
      occurenceEndPeriod,
      practitionerId,
      practitionerName,
      dosageText,
      routeCode,
      routeName,
      doseUnit,
      doseCode,
      rateRatioCode,
      denominatorCode,
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

  submitMedicationAdministrationRequest() {
    if (hasEmptyController()) {
      showEmptyFieldDialog(context);
    }
    context.read<FhirpatBloc>().add(
          FhirCreateMedicationAdministrationEvent(
            medicationAdministrationId: medicationAdministrationId.text,
            medicationId: medicationId.text,
            medicineCode: medicineCode.text,
            medicineName: medicineName.text,
            status: status.text,
            medicationReferenceRequestId: medicationReferenceRequestId.text,
            patientName: patientName.text,
            patientId: patientId.text,
            encounterId: encounterId.text,
            encounterDisplay: encounterDisplay.text,
            occurenceStartPeriod: occurenceStartPeriod.text,
            occurenceEndPeriod: occurenceEndPeriod.text,
            practitionerId: practitionerId.text,
            practitionerName: practitionerName.text,
            dosageText: dosageText.text,
            routeCode: routeCode.text,
            routeName: routeName.text,
            doseValue: doseValue,
            doseUnit: doseUnit.text,
            doseCode: doseCode.text,
            rateRatioValue: rateRatioValue,
            rateRatioCode: rateRatioCode.text,
            denominatorValue: denominatorValue,
            denominatorCode: denominatorCode.text,
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
              child: Text('Medication Request form'),
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      height: 600,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: ConstantVars.cardColorTheme,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: customText2(
                                'Medication Administration details'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedTextField(
                            label: 'Medication Administration Id',
                            controller: medicationAdministrationId,
                          ),
                          AnimatedTextField(
                            label: 'Medication Id',
                            controller: medicationId,
                          ),
                          AnimatedTextField(
                            label: 'Medicine Code',
                            controller: medicineCode,
                          ),
                          AnimatedTextField(
                            label: 'Medicine Name',
                            controller: medicineName,
                          ),
                          AnimatedTextField(
                            label: 'Medication Status',
                            controller: status,
                          ),
                          AnimatedTextField(
                            label: 'Medication Request reference Id',
                            controller: medicationReferenceRequestId,
                          ),
                          AnimatedTextField(
                            label: 'Patient Name',
                            controller: patientName,
                          ),
                          AnimatedTextField(
                            label: 'Patient Id',
                            controller: patientId,
                          ),
                          AnimatedTextField(
                            label: 'Encounter Id',
                            controller: encounterId,
                          ),
                          AnimatedTextField(
                            label: 'Encounter Display',
                            controller: encounterDisplay,
                          ),
                          AnimatedTextField(
                            label: 'Occurrence Start period',
                            controller: occurenceStartPeriod,
                          ),
                          AnimatedTextField(
                            label: 'Occurrence End period',
                            controller: occurenceEndPeriod,
                          ),
                          AnimatedTextField(
                            label: 'Practitioner Id',
                            controller: practitionerId,
                          ),
                          AnimatedTextField(
                            label: 'Practitioner Name',
                            controller: practitionerName,
                          ),
                          AnimatedTextField(
                            label: 'Dosage Text',
                            controller: dosageText,
                          ),
                          AnimatedTextField(
                            label: 'Route Code',
                            controller: routeCode,
                          ),
                          AnimatedTextField(
                            label: 'Route Name',
                            controller: routeName,
                          ),
                          AnimatedTextFieldInt(
                            label: 'Dose Value',
                            initialValue: doseValue,
                          ),
                          AnimatedTextField(
                            label: 'Dose Unit',
                            controller: doseUnit,
                          ),
                          AnimatedTextField(
                            label: 'Dose Code',
                            controller: doseCode,
                          ),
                          AnimatedTextFieldInt(
                            label: 'Rate Ratio Value',
                            initialValue: rateRatioValue,
                          ),
                          AnimatedTextFieldInt(
                            label: 'Denominator Value',
                            initialValue: denominatorValue,
                          ),
                          AnimatedTextField(
                            label: 'Denominator Code',
                            controller: denominatorCode,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: submitMedicationAdministrationRequest,
                    child: CustomContainer3(
                      title: state
                              is FhirCreateMedicationAdministrationLoadingState
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
                  ),
                ],
              ),
              state is FhirCreateMedicationAdministrationLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
