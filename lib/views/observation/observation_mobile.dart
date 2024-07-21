part of observation_view;

class _ObservationMobile extends StatefulWidget {
  const _ObservationMobile();

  @override
  State<_ObservationMobile> createState() => _ObservationMobileState();
}

class _ObservationMobileState extends State<_ObservationMobile>
    with LogMixin, SingleTickerProviderStateMixin {
  TextEditingController existingPatientIdController = TextEditingController();
  TextEditingController patientNameController = TextEditingController();
  TextEditingController practitionerNameController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController typeCodeController = TextEditingController();
  TextEditingController typeDisplayController = TextEditingController();
  TextEditingController valueQuantityController = TextEditingController();
  TextEditingController identifierController = TextEditingController();
  TextEditingController conditionIdController = TextEditingController();
  TextEditingController practitionerIdController = TextEditingController();
  TextEditingController valueUnitController = TextEditingController();
  TextEditingController valueCodeController = TextEditingController();
  TextEditingController interpretationCodeController = TextEditingController();
  TextEditingController interpretationDisplayController =
      TextEditingController();
  TextEditingController methodCodeController = TextEditingController();
  TextEditingController methodTextController = TextEditingController();
  TextEditingController observationIdController = TextEditingController();
  TextEditingController observationFhirIdController = TextEditingController();
  TextEditingController lowReferenceRangeQuantityValueController =
      TextEditingController();
  TextEditingController lowReferenceRangeQuantityUnitController =
      TextEditingController();
  TextEditingController lowReferenceRangeQuantityCodeController =
      TextEditingController();
  TextEditingController highReferenceRangeQuantityValueController =
      TextEditingController();
  TextEditingController highReferenceRangeQuantityCodeController =
      TextEditingController();
  TextEditingController highReferenceRangeQuantityUnitController =
      TextEditingController();

  bool hasEmptyController() {
    final controllers = [
      existingPatientIdController,
      patientNameController,
      practitionerNameController,
      conditionController,
      statusController,
      typeCodeController,
      typeDisplayController,
      valueQuantityController,
      identifierController,
      conditionIdController,
      practitionerIdController,
      valueUnitController,
      valueCodeController,
      interpretationCodeController,
      interpretationDisplayController,
      methodCodeController,
      methodTextController,
      observationIdController,
      lowReferenceRangeQuantityCodeController,
      lowReferenceRangeQuantityUnitController,
      lowReferenceRangeQuantityValueController,
      highReferenceRangeQuantityCodeController,
      highReferenceRangeQuantityUnitController,
      highReferenceRangeQuantityValueController
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

  submitObservation() {
    if (hasEmptyController()) {
      showEmptyFieldDialog(context);
    }
    context.read<FhirpatBloc>().add(
          FhirPatCreateObservationEvent(
              existingPatientId: existingPatientIdController.text,
              patientName: patientNameController.text,
              practitionerName: practitionerNameController.text,
              condition: conditionController.text,
              status: statusController.text,
              typeCode: typeCodeController.text,
              typeDisplay: typeDisplayController.text,
              valueQuantity: valueQuantityController.text,
              identifier: identifierController.text,
              conditionId: conditionIdController.text,
              practitionerId: practitionerIdController.text,
              valueUnit: valueUnitController.text,
              valueCode: valueCodeController.text,
              interpretationCode: interpretationCodeController.text,
              interpretationDisplay: interpretationDisplayController.text,
              observationId: observationIdController.text,
              methodCode: methodCodeController.text,
              methodText: methodTextController.text,
              lowReferenceRangeQuantityValue:
                  lowReferenceRangeQuantityValueController.text,
              lowReferenceRangeCodeValue:
                  lowReferenceRangeQuantityCodeController.text,
              lowReferenceRangeUnitValue:
                  lowReferenceRangeQuantityUnitController.text,
              highReferenceRangeCodeValue:
                  highReferenceRangeQuantityCodeController.text,
              highReferenceRangeQuantityValue:
                  highReferenceRangeQuantityValueController.text,
              highReferenceRangeUnitValue:
                  highReferenceRangeQuantityUnitController.text),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FhirpatBloc, FhirpatState>(listener: (context, state) {
      warningLog('Checking for observation State $state');
      if (state is FhirCreateObservationErrorState) {
        showErrorDialog(context, state.message);
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('Observation form'),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: ConstantVars.cardColorTheme,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: customText2('Observation details'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AnimatedTextField(
                              label: 'Patient Id(Patient/f001)',
                              controller: existingPatientIdController,
                            ),
                            AnimatedTextField(
                              label: 'Observation Id',
                              controller: observationIdController,
                            ),
                            AnimatedTextField(
                              label: 'Patient Name',
                              controller: patientNameController,
                            ),
                            AnimatedTextField(
                              label: 'Practitioner Name',
                              controller: practitionerNameController,
                            ),
                            AnimatedTextField(
                              label: 'practitionerId',
                              controller: practitionerIdController,
                            ),
                            AnimatedTextField(
                              label: 'Condition',
                              controller: conditionController,
                            ),
                            AnimatedTextField(
                              label: 'Condtion Id',
                              controller: conditionIdController,
                            ),
                            AnimatedTextField(
                              label: 'Status',
                              controller: statusController,
                            ),
                            AnimatedTextField(
                              label: 'Identifier',
                              controller: identifierController,
                            ),
                            AnimatedTextField(
                              label: 'interpretationCode',
                              controller: interpretationCodeController,
                            ),
                            AnimatedTextField(
                              label: 'interpretationDisplay',
                              controller: interpretationDisplayController,
                            ),
                            AnimatedTextField(
                              label: 'Value Quantity',
                              controller: valueQuantityController,
                            ),
                            AnimatedTextField(
                              label: 'Value Unit',
                              controller: valueUnitController,
                            ),
                            AnimatedTextField(
                              label: 'Value Code',
                              controller: valueCodeController,
                            ),
                            AnimatedTextField(
                              label: 'method Code',
                              controller: methodCodeController,
                            ),
                            AnimatedTextField(
                              label: 'method Text',
                              controller: methodTextController,
                            ),
                            AnimatedTextField(
                              label: 'Low Reference range value',
                              controller:
                                  lowReferenceRangeQuantityValueController,
                            ),
                            AnimatedTextField(
                              label: 'Low Reference range unit',
                              controller:
                                  lowReferenceRangeQuantityUnitController,
                            ),
                            AnimatedTextField(
                              label: 'Low Reference range code',
                              controller:
                                  lowReferenceRangeQuantityCodeController,
                            ),
                            AnimatedTextField(
                              label: 'High Reference range value',
                              controller:
                                  highReferenceRangeQuantityValueController,
                            ),
                            AnimatedTextField(
                              label: 'High Reference range unit',
                              controller:
                                  highReferenceRangeQuantityUnitController,
                            ),
                            AnimatedTextField(
                              label: 'High Reference range code',
                              controller:
                                  highReferenceRangeQuantityCodeController,
                            ),
                            AnimatedTextField(
                              label: 'Type Code',
                              controller: typeCodeController,
                            ),
                            AnimatedTextField(
                              label: 'Type Display',
                              controller: typeDisplayController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: submitObservation,
                  child: CustomContainer3(
                    title: state is FhirCreateObservationLoadingState
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
            state is FhirCreateObservationLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    });
  }
}
