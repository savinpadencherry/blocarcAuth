part of care_plan_view;

class _CarePlanMobile extends StatefulWidget {
  const _CarePlanMobile(Key? key) : super(key: key);

  @override
  State<_CarePlanMobile> createState() => _CarePlanMobileState();
}

class _CarePlanMobileState extends State<_CarePlanMobile> with LogMixin {
  final TextEditingController carePlanIDController = TextEditingController();
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController carePlanStatusController =
      TextEditingController();
  final TextEditingController carePlanIntentController =
      TextEditingController();
  final TextEditingController intentController = TextEditingController();
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController startPeriodController = TextEditingController();
  final TextEditingController endPeriodController = TextEditingController();
  final TextEditingController occurencePeriodController =
      TextEditingController();
  final TextEditingController practitionerIdController =
      TextEditingController();
  final TextEditingController practitionerNameController =
      TextEditingController();
  final TextEditingController conditionIDController = TextEditingController();
  final TextEditingController conditionNameController = TextEditingController();
  final TextEditingController lifeCycleStatusController =
      TextEditingController();
  final TextEditingController achievementStatusController =
      TextEditingController();
  final TextEditingController achievementStatusCodeController =
      TextEditingController();
  final TextEditingController descrptionController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController activityPlannedReferenceController =
      TextEditingController();
  final TextEditingController activityStatusController =
      TextEditingController();
  final TextEditingController activityIntentController =
      TextEditingController();
  final TextEditingController activityCodeController = TextEditingController();
  final TextEditingController acitivityDisplayController =
      TextEditingController();

  bool hasEmptyController() {
    final controllers = [
      carePlanIDController,
      identifierController,
      statusController,
      carePlanStatusController,
      carePlanIntentController,
      intentController,
      patientIdController,
      patientNameController,
      startPeriodController,
      endPeriodController,
      occurencePeriodController,
      practitionerIdController,
      practitionerNameController,
      conditionIDController,
      conditionNameController,
      lifeCycleStatusController,
      achievementStatusController,
      descrptionController,
      noteController,
      activityPlannedReferenceController,
      activityStatusController,
      activityIntentController,
      activityCodeController,
      acitivityDisplayController,
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

  submitCarePLan() {
    if (hasEmptyController()) {
      showEmptyFieldDialog(context);
    }
    context.read<FhirpatBloc>().add(
          FhirCreateCarePlanEvent(
            carePlanID: carePlanIDController.text,
            intent: intentController.text,
            patientName: patientNameController.text,
            practitionerName: practitionerNameController.text,
            patientId: patientIdController.text,
            startPeriod: startPeriodController.text,
            endPeriod: endPeriodController.text,
            occurenceDate: occurencePeriodController.text,
            conditionID: conditionIDController.text,
            conditionName: conditionNameController.text,
            lifeCycleStatus: lifeCycleStatusController.text,
            achievementStatus: achievementStatusController.text,
            achievementStatusCode: achievementStatusCodeController.text,
            status: statusController.text,
            description: descrptionController.text,
            identifier: identifierController.text,
            note: noteController.text,
            activityPlannedReference: activityPlannedReferenceController.text,
            activityStatus: activityStatusController.text,
            activityIntent: activityIntentController.text,
            activityCode: activityCodeController.text,
            activityDisplay: acitivityDisplayController.text,
            carePlanStatus: carePlanStatusController.text,
            carePlanIntent: carePlanIntentController.text,
            practitionerId: practitionerIdController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FhirpatBloc, FhirpatState>(
      listener: (context, state) {
        warningLog('Care PLan $state');
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Care Plan'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: ConstantVars.cardColorTheme,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: customText2('Care Plan details'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AnimatedTextField(
                          label: 'Care Plan Id',
                          controller: carePlanIDController,
                        ),
                        AnimatedTextField(
                          label: 'Care Plan Status',
                          controller: carePlanStatusController,
                        ),
                        AnimatedTextField(
                          label: 'Care Plan Intent',
                          controller: carePlanIntentController,
                        ),
                        AnimatedTextField(
                          label: 'Identifier',
                          controller: identifierController,
                        ),
                        AnimatedTextField(
                          label: 'Status',
                          controller: statusController,
                        ),
                        AnimatedTextField(
                          label: 'Intent',
                          controller: intentController,
                        ),
                        AnimatedTextField(
                          label: 'Start Date',
                          controller: startPeriodController,
                        ),
                        AnimatedTextField(
                          label: 'End Date',
                          controller: endPeriodController,
                        ),
                        AnimatedTextField(
                          label: 'Occurence Date',
                          controller: occurencePeriodController,
                        ),
                        AnimatedTextField(
                          label: 'Intent',
                          controller: intentController,
                        ),
                        AnimatedTextField(
                          label: 'Patient Id',
                          controller: patientIdController,
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
                          label: 'Practitioner Id',
                          controller: practitionerIdController,
                        ),
                        AnimatedTextField(
                          label: 'Condition Id',
                          controller: conditionIDController,
                        ),
                        AnimatedTextField(
                          label: 'Condition Name',
                          controller: conditionNameController,
                        ),
                        AnimatedTextField(
                          label: 'Life Cycle Status',
                          controller: lifeCycleStatusController,
                        ),
                        AnimatedTextField(
                          label: 'Achievement Status',
                          controller: achievementStatusController,
                        ),
                        AnimatedTextField(
                          label: 'Achievement Status Code',
                          controller: achievementStatusCodeController,
                        ),
                        AnimatedTextField(
                          label: 'Description',
                          controller: descrptionController,
                        ),
                        AnimatedTextField(
                          label: 'Note',
                          controller: noteController,
                        ),
                        AnimatedTextField(
                          label: 'Activity Planned Reference',
                          controller: activityPlannedReferenceController,
                        ),
                        AnimatedTextField(
                          label: 'Activity Status',
                          controller: activityStatusController,
                        ),
                        AnimatedTextField(
                          label: 'Activity Intent',
                          controller: activityIntentController,
                        ),
                        AnimatedTextField(
                          label: 'Activity code',
                          controller: activityCodeController,
                        ),
                        AnimatedTextField(
                          label: 'Activity display',
                          controller: acitivityDisplayController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: submitCarePLan,
                child: CustomContainer3(
                  title: state is FhirCreateCarePlanLoadingState
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
        );
      },
    );
  }
}
