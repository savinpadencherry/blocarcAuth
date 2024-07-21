part of medication_request_view;

class _MedicationRequestMobile extends StatefulWidget {
  const _MedicationRequestMobile();

  @override
  State<_MedicationRequestMobile> createState() =>
      _MedicationRequestMobileState();
}

class _MedicationRequestMobileState extends State<_MedicationRequestMobile>
    with LogMixin {
  TextEditingController medicationRequestId = TextEditingController();
  TextEditingController medicationId = TextEditingController();
  TextEditingController medicationCode = TextEditingController();
  TextEditingController medicationDisplay = TextEditingController();
  TextEditingController medicineCode = TextEditingController();
  TextEditingController medicineName = TextEditingController();
  TextEditingController identifier = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController intent = TextEditingController();
  TextEditingController categoryCode = TextEditingController();
  TextEditingController categoryDisplay = TextEditingController();
  TextEditingController patientId = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController encounterId = TextEditingController();
  TextEditingController encounterDisplay = TextEditingController();
  TextEditingController supportingInfoProcedure = TextEditingController();
  TextEditingController authoredOnDate = TextEditingController();
  TextEditingController practitionerName = TextEditingController();
  TextEditingController practitionerId = TextEditingController();
  TextEditingController reasonCode = TextEditingController();
  TextEditingController reasonDisplay = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController dosageInstruction = TextEditingController();
  TextEditingController dosageInstructionCode = TextEditingController();
  TextEditingController additionalDosageInstructionText =
      TextEditingController();
  int? frequency;
  int? period;
  TextEditingController periodUnit = TextEditingController();
  TextEditingController when = TextEditingController();
  TextEditingController routeCode = TextEditingController();
  TextEditingController routeMessage = TextEditingController();
  TextEditingController methodText = TextEditingController();
  TextEditingController methodCode = TextEditingController();
  TextEditingController doseRateTypeCode = TextEditingController();
  TextEditingController doseRateTypeDisplay = TextEditingController();
  int? doseRangeLowValue;
  TextEditingController doseRangeLowUnit = TextEditingController();
  TextEditingController doseRangeLowCode = TextEditingController();
  int? doseRangeHighValue;
  TextEditingController doseRangeHighUnit = TextEditingController();
  TextEditingController doseRangeHighCode = TextEditingController();
  TextEditingController dispenseRequestStartDate = TextEditingController();
  TextEditingController dispenseRequestEndDate = TextEditingController();
  TextEditingController dispenseRequestNumberOfRequests =
      TextEditingController();
  int? dispenseRequestQuantityValue;
  TextEditingController dispenseRequestQuantityUnit = TextEditingController();
  TextEditingController dispenseRequestQuantityCode = TextEditingController();
  int? expectedSupplyDurationValue;
  TextEditingController expectedSupplyDurationUnit = TextEditingController();
  TextEditingController expectedSupplyDurationCode = TextEditingController();
  bool? substitutionAllowed;
  TextEditingController substitutionAllowedCode = TextEditingController();
  TextEditingController substitutionAllowedDisplay = TextEditingController();
  TextEditingController medicationRequestFhirID = TextEditingController();
  TextEditingController medicationRequestSource = TextEditingController();

  bool hasEmptyController() {
    final controllers = [
      medicationRequestId,
      medicationId,
      medicationCode,
      medicationDisplay,
      medicineCode,
      medicineName,
      identifier,
      status,
      intent,
      categoryCode,
      categoryDisplay,
      patientId,
      patientName,
      encounterId,
      encounterDisplay,
      supportingInfoProcedure,
      authoredOnDate,
      practitionerName,
      practitionerId,
      reasonCode,
      reasonDisplay,
      notes,
      dosageInstruction,
      dosageInstructionCode,
      additionalDosageInstructionText,
      periodUnit,
      when,
      routeCode,
      routeMessage,
      methodText,
      methodCode,
      doseRateTypeCode,
      doseRateTypeDisplay,
      doseRangeLowUnit,
      doseRangeLowCode,
      doseRangeHighUnit,
      doseRangeHighCode,
      dispenseRequestStartDate,
      dispenseRequestEndDate,
      dispenseRequestNumberOfRequests,
      dispenseRequestQuantityUnit,
      dispenseRequestQuantityCode,
      expectedSupplyDurationUnit,
      expectedSupplyDurationCode,
      substitutionAllowedCode,
      substitutionAllowedDisplay,
      medicationRequestFhirID,
      medicationRequestSource,
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

  submitMedicationRequest() {
    if (hasEmptyController()) {
      showEmptyFieldDialog(context);
    }
    context.read<FhirpatBloc>().add(
          FhirPatCreateMedicationRequestEvent(
            medicationRequestId: medicationRequestId.text,
            medicationId: medicationId.text,
            medicationCode: medicationCode.text,
            medicationDisplay: medicationDisplay.text,
            medicineCode: medicineCode.text,
            medicineName: medicineName.text,
            status: status.text,
            intent: intent.text,
            categoryCode: categoryCode.text,
            categoryDisplay: categoryDisplay.text,
            patientId: patientId.text,
            patientName: patientName.text,
            encounterId: encounterId.text,
            encounterDisplay: encounterDisplay.text,
            supportingInfoProcedure: supportingInfoProcedure.text,
            authoredOnDate: authoredOnDate.text,
            practitionerName: practitionerName.text,
            practitionerId: practitionerId.text,
            reasonCode: reasonCode.text,
            reasonDisplay: reasonDisplay.text,
            notes: notes.text,
            dosageInstruction: dosageInstruction.text,
            dosageInstructionCode: dosageInstructionCode.text,
            additionalDosageInstructionText:
                additionalDosageInstructionText.text,
            frequency: frequency,
            period: period,
            periodUnit: periodUnit.text,
            when: when.text,
            routeCode: routeCode.text,
            routeMessage: routeMessage.text,
            methodCode: methodCode.text,
            methodText: methodText.text,
            doseRateTypeCode: doseRateTypeCode.text,
            doseRateTypeDisplay: doseRateTypeDisplay.text,
            doseRangeLowValue: doseRangeLowValue,
            doseRangeHighUnit: doseRangeHighUnit.text,
            doseRangeLowUnit: doseRangeLowUnit.text,
            doseRangeLowCode: doseRangeLowCode.text,
            doseRangeHighCode: doseRangeHighCode.text,
            doseRangeHighValue: doseRangeHighValue,
            dispenseRequestStartDate: dispenseRequestStartDate.text,
            dispenseRequestEndDate: dispenseRequestEndDate.text,
            dispenseRequestNumberOfRequests:
                dispenseRequestNumberOfRequests.text,
            dispenseRequestQuantityValue: dispenseRequestQuantityValue,
            dispenseRequestQuantityUnit: dispenseRequestQuantityUnit.text,
            dispenseRequestQuantityCode: dispenseRequestQuantityCode.text,
            expectedSupplyDurationCode: expectedSupplyDurationCode.text,
            expectedSupplyDurationUnit: expectedSupplyDurationUnit.text,
            expectedSupplyDurationValue: expectedSupplyDurationValue,
            substitutionAllowed: substitutionAllowed,
            substitutionAllowedCode: substitutionAllowedCode.text,
            substitutionAllowedDisplay: substitutionAllowedDisplay.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FhirpatBloc, FhirpatState>(
      listener: (context, state) {
        warningLog('Medication request $state');
      },
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: customText2('Patient details'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AnimatedTextField(
                              label: 'Medication Request Id',
                              controller: medicationRequestId,
                            ),
                            AnimatedTextField(
                              label: 'Medication Id',
                              controller: medicationId,
                            ),
                            AnimatedTextField(
                              label: 'Medication Code',
                              controller: medicationCode,
                            ),
                            AnimatedTextField(
                              label: 'Medication display',
                              controller: medicationDisplay,
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
                              label: 'Identifier',
                              controller: identifier,
                            ),
                            AnimatedTextField(
                              label: 'Status',
                              controller: status,
                            ),
                            AnimatedTextField(
                              label: 'intent',
                              controller: intent,
                            ),
                            AnimatedTextField(
                              label: 'categoryCode',
                              controller: categoryCode,
                            ),
                            AnimatedTextField(
                              label: 'categoryDisplay',
                              controller: categoryDisplay,
                            ),
                            AnimatedTextField(
                              label: 'patientId',
                              controller: patientId,
                            ),
                            AnimatedTextField(
                              label: 'patient Name',
                              controller: patientName,
                            ),
                            AnimatedTextField(
                              label: 'encounterId',
                              controller: encounterDisplay,
                            ),
                            AnimatedTextField(
                              label: 'supportingInfoProcedure',
                              controller: supportingInfoProcedure,
                            ),
                            AnimatedTextField(
                              label: 'authoredOnDate',
                              controller: authoredOnDate,
                            ),
                            AnimatedTextField(
                              label: 'practitioner Name',
                              controller: practitionerName,
                            ),
                            AnimatedTextField(
                              label: 'practitioner Id',
                              controller: practitionerId,
                            ),
                            AnimatedTextField(
                              label: 'reason code',
                              controller: reasonCode,
                            ),
                            AnimatedTextField(
                              label: 'reason display',
                              controller: reasonDisplay,
                            ),
                            AnimatedTextField(
                              label: 'notes',
                              controller: notes,
                            ),
                            AnimatedTextField(
                              label: 'Dosage Instructions',
                              controller: dosageInstruction,
                            ),
                            AnimatedTextField(
                              label: 'Dosage Instruction code',
                              controller: dosageInstructionCode,
                            ),
                            AnimatedTextField(
                              label: 'additional Dosage Instruction Text',
                              controller: additionalDosageInstructionText,
                            ),
                            AnimatedTextFieldInt(
                              label: 'frequency',
                              initialValue: frequency!,
                            ),
                            AnimatedTextFieldInt(
                              label: 'period',
                              initialValue: period!,
                            ),
                            AnimatedTextField(
                              label: 'period Unit',
                              controller: periodUnit,
                            ),
                            AnimatedTextField(
                              label: 'When',
                              controller: when,
                            ),
                            AnimatedTextField(
                              label: 'route Code',
                              controller: routeCode,
                            ),
                            AnimatedTextField(
                              label: 'route Message',
                              controller: routeMessage,
                            ),
                            AnimatedTextField(
                              label: 'method Text',
                              controller: methodText,
                            ),
                            AnimatedTextField(
                              label: 'method Code',
                              controller: methodCode,
                            ),
                            AnimatedTextField(
                              label: 'Dose Rate Type Code',
                              controller: doseRateTypeCode,
                            ),
                            AnimatedTextField(
                              label: 'Dose Rate Type Display',
                              controller: doseRateTypeDisplay,
                            ),
                            AnimatedTextFieldInt(
                              label: 'Dose Range Low Value',
                              initialValue: doseRangeLowValue!,
                            ),
                            AnimatedTextField(
                              label: 'Dose Range Low unit',
                              controller: doseRangeLowUnit,
                            ),
                            AnimatedTextField(
                              label: 'Dose Range Low Code',
                              controller: doseRangeLowCode,
                            ),
                            AnimatedTextFieldInt(
                              label: 'Dose Range High Value',
                              initialValue: doseRangeHighValue!,
                            ),
                            AnimatedTextField(
                              label: 'Dose Range High Code',
                              controller: doseRangeHighCode,
                            ),
                            AnimatedTextField(
                              label: 'Dose Range High Unit',
                              controller: doseRangeHighUnit,
                            ),
                            AnimatedTextField(
                              label: 'Dispense Request Start Date',
                              controller: dispenseRequestStartDate,
                            ),
                            AnimatedTextField(
                              label: 'Dispense Request End Date',
                              controller: dispenseRequestEndDate,
                            ),
                            AnimatedTextField(
                              label: 'Dispense Request Number Of Requests',
                              controller: dispenseRequestNumberOfRequests,
                            ),
                            AnimatedTextFieldInt(
                              label: 'Dispense Request Quantity Value',
                              initialValue: dispenseRequestQuantityValue!,
                            ),
                            AnimatedTextField(
                              label: 'Dispense Request Quantity Unit',
                              controller: dispenseRequestQuantityUnit,
                            ),
                            AnimatedTextField(
                              label: 'Dispense Request Quantity Code',
                              controller: dispenseRequestQuantityCode,
                            ),
                            AnimatedTextField(
                              label: 'Expected Supply Duration Code',
                              controller: expectedSupplyDurationCode,
                            ),
                            AnimatedTextFieldInt(
                              label: 'Expected Supply Duration Value',
                              initialValue: expectedSupplyDurationValue!,
                            ),
                            AnimatedTextField(
                              label: 'Expected Supply Duration Unit',
                              controller: expectedSupplyDurationUnit,
                            ),
                            AnimatedBooleanField(
                              label: 'Substitution Allowed',
                              initialValue: substitutionAllowed!,
                            ),
                            AnimatedTextField(
                              label: 'Substitution Allowed Code',
                              controller: substitutionAllowedCode,
                            ),
                            AnimatedTextField(
                              label: 'Substitution Allowed Display',
                              controller: substitutionAllowedDisplay,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: submitMedicationRequest,
                    child: CustomContainer3(
                      title: state is FhirCreateMedicationRequestLoadingState
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
              state is FhirCreateMedicationRequestLoadingState
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
