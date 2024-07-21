// ignore_for_file: public_member_api_docs, sort_constructors_first
part of claim_view;

class _ClaimMobile extends StatefulWidget {
  const _ClaimMobile();

  @override
  State<_ClaimMobile> createState() => _ClaimMobileState();
}

class _ClaimMobileState extends State<_ClaimMobile> with LogMixin {
  TextEditingController claimID = TextEditingController();
  TextEditingController patientId = TextEditingController();
  TextEditingController patientFamilyName = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController patientGender = TextEditingController();
  TextEditingController patientDOB = TextEditingController();
  TextEditingController patientPhoneNumber = TextEditingController();
  TextEditingController patientEmail = TextEditingController();
  TextEditingController patientAddress = TextEditingController();
  TextEditingController patientCity = TextEditingController();
  TextEditingController patientLineAddress = TextEditingController();
  TextEditingController patientCityAddress = TextEditingController();
  TextEditingController patientStateAdress = TextEditingController();
  TextEditingController patientCountryAdress = TextEditingController();
  TextEditingController patientPostalCode = TextEditingController();
  TextEditingController coverageId = TextEditingController();
  TextEditingController coverageIdentifierValue = TextEditingController();
  TextEditingController coverageStatus = TextEditingController();
  TextEditingController coverageValue = TextEditingController();
  TextEditingController coverageKind = TextEditingController();
  TextEditingController coverageTypeCode = TextEditingController();
  TextEditingController coverageTypeDisplay = TextEditingController();
  TextEditingController relationshipCode = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController insurerId = TextEditingController();
  TextEditingController insurerDisplay = TextEditingController();
  TextEditingController classCode = TextEditingController();
  TextEditingController classValue = TextEditingController();
  TextEditingController use = TextEditingController();
  TextEditingController typeCode = TextEditingController();
  TextEditingController subTypeCode = TextEditingController();
  TextEditingController subTypeName = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController organizationId = TextEditingController();
  TextEditingController priorityCode = TextEditingController();
  TextEditingController payeeCode = TextEditingController();
  TextEditingController practitionerName = TextEditingController();
  TextEditingController patientStatusCode = TextEditingController();
  TextEditingController diagnosisCode = TextEditingController();
  TextEditingController diagnosisDisplay = TextEditingController();
  TextEditingController insuranceFocal = TextEditingController();
  TextEditingController insuranceId = TextEditingController();
  TextEditingController careTeamSequence = TextEditingController();
  TextEditingController informationSequence = TextEditingController();
  TextEditingController serviceCode = TextEditingController();
  TextEditingController serviceDisplay = TextEditingController();
  TextEditingController servicedDate = TextEditingController();
  TextEditingController locationCode = TextEditingController();
  TextEditingController locationDisplay = TextEditingController();
  double? unitPrice;
  TextEditingController currency = TextEditingController();
  double? netValue;
  double? totalValue;

  bool hasEmptyController() {
    final List<TextEditingController> controllers = [
      claimID,
      patientId,
      patientFamilyName,
      patientName,
      patientGender,
      patientDOB,
      patientPhoneNumber,
      patientEmail,
      patientAddress,
      patientCity,
      patientLineAddress,
      patientCityAddress,
      patientStateAdress,
      patientCountryAdress,
      patientPostalCode,
      coverageId,
      coverageIdentifierValue,
      coverageStatus,
      coverageValue,
      coverageKind,
      coverageTypeCode,
      coverageTypeDisplay,
      relationshipCode,
      startDate,
      endDate,
      insurerId,
      insurerDisplay,
      classCode,
      classValue,
      use,
      typeCode,
      subTypeCode,
      subTypeName,
      status,
      organizationId,
      priorityCode,
      payeeCode,
      practitionerName,
      patientStatusCode,
      diagnosisCode,
      diagnosisDisplay,
      insuranceFocal,
      insuranceId,
      careTeamSequence,
      informationSequence,
      serviceCode,
      serviceDisplay,
      servicedDate,
      locationCode,
      locationDisplay,
      currency,
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

  submitClaim() {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FhirpatBloc, FhirpatState>(
      listener: (context, state) {},
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
                          label: 'Claim Id',
                          controller: claimID,
                        ),
                        AnimatedTextField(
                          label: 'Patient Id',
                          controller: patientId,
                        ),
                        AnimatedTextField(
                          label: 'Patient Family Name',
                          controller: patientFamilyName,
                        ),
                        AnimatedTextField(
                          label: 'Patient Name',
                          controller: patientName,
                        ),
                        AnimatedTextField(
                          label: 'Patient Gender',
                          controller: patientGender,
                        ),
                        AnimatedTextField(
                          label: 'Patient DOB',
                          controller: patientDOB,
                        ),
                        AnimatedTextField(
                          label: 'Patient Phone Number',
                          controller: patientPhoneNumber,
                        ),
                        AnimatedTextField(
                          label: 'Patient Email',
                          controller: patientEmail,
                        ),
                        AnimatedTextField(
                          label: 'Patient Address',
                          controller: patientAddress,
                        ),
                        AnimatedTextField(
                          label: 'Patient City',
                          controller: patientCity,
                        ),
                        AnimatedTextField(
                          label: 'Patient Line Address',
                          controller: patientLineAddress,
                        ),
                        AnimatedTextField(
                          label: 'Patient City Address',
                          controller: patientCityAddress,
                        ),
                        AnimatedTextField(
                          label: 'Patient State Address',
                          controller: patientStateAdress,
                        ),
                        AnimatedTextField(
                          label: 'Patient Country Address',
                          controller: patientCountryAdress,
                        ),
                        AnimatedTextField(
                          label: 'Patient Postal Code',
                          controller: patientPostalCode,
                        ),
                        AnimatedTextField(
                          label: 'Coverage Id',
                          controller: coverageId,
                        ),
                        AnimatedTextField(
                          label: 'Coverage Identifier Value',
                          controller: coverageIdentifierValue,
                        ),
                        AnimatedTextField(
                          label: 'Coverage Status',
                          controller: coverageStatus,
                        ),
                        AnimatedTextField(
                          label: 'Coverage Value',
                          controller: coverageValue,
                        ),
                        AnimatedTextField(
                          label: 'Coverage Kind',
                          controller: coverageKind,
                        ),
                        AnimatedTextField(
                          label: 'Coverage Type Code',
                          controller: coverageTypeCode,
                        ),
                        AnimatedTextField(
                          label: 'Coverage Type Display',
                          controller: coverageTypeDisplay,
                        ),
                        AnimatedTextField(
                          label: 'Relationship Code',
                          controller: relationshipCode,
                        ),
                        AnimatedTextField(
                          label: 'Start Date',
                          controller: startDate,
                        ),
                        AnimatedTextField(
                          label: 'End Date',
                          controller: endDate,
                        ),
                        AnimatedTextField(
                          label: 'Insurer Id',
                          controller: insurerId,
                        ),
                        AnimatedTextField(
                          label: 'Insurer Display',
                          controller: insurerDisplay,
                        ),
                        AnimatedTextField(
                          label: 'Class Code',
                          controller: classCode,
                        ),
                        AnimatedTextField(
                          label: 'Class Value',
                          controller: classValue,
                        ),
                        AnimatedTextField(
                          label: 'Use',
                          controller: use,
                        ),
                        AnimatedTextField(
                          label: 'Type Code',
                          controller: typeCode,
                        ),
                        AnimatedTextField(
                          label: 'Sub Type Code',
                          controller: subTypeCode,
                        ),
                        AnimatedTextField(
                          label: 'Sub Type Name',
                          controller: subTypeName,
                        ),
                        AnimatedTextField(
                          label: 'Status',
                          controller: status,
                        ),
                        AnimatedTextField(
                          label: 'Organization Id',
                          controller: organizationId,
                        ),
                        AnimatedTextField(
                          label: 'Priority Code',
                          controller: priorityCode,
                        ),
                        AnimatedTextField(
                          label: 'Payee Code',
                          controller: payeeCode,
                        ),
                        AnimatedTextField(
                          label: 'Practitioner Name',
                          controller: practitionerName,
                        ),
                        AnimatedTextField(
                          label: 'Patient Status Code',
                          controller: patientStatusCode,
                        ),
                        AnimatedTextField(
                          label: 'Diagnosis Code',
                          controller: diagnosisCode,
                        ),
                        AnimatedTextField(
                          label: 'Diagnosis Display',
                          controller: diagnosisDisplay,
                        ),
                        AnimatedTextField(
                          label: 'Insurance Focal',
                          controller: insuranceFocal,
                        ),
                        AnimatedTextField(
                          label: 'Insurance Id',
                          controller: insuranceId,
                        ),
                        AnimatedTextField(
                          label: 'Care Team Sequence',
                          controller: careTeamSequence,
                        ),
                        AnimatedTextField(
                          label: 'Information Sequence',
                          controller: informationSequence,
                        ),
                        AnimatedTextField(
                          label: 'Service Code',
                          controller: serviceCode,
                        ),
                        AnimatedTextField(
                          label: 'Service Display',
                          controller: serviceDisplay,
                        ),
                        AnimatedTextField(
                          label: 'location Code',
                          controller: locationCode,
                        ),
                        AnimatedTextField(
                          label: 'Location Display',
                          controller: locationDisplay,
                        ),
                        AnimatedDoubleField(
                          label: 'Unit Price',
                          initialValue: unitPrice!,
                        ),
                        AnimatedDoubleField(
                          label: 'Net Price',
                          initialValue: netValue!,
                        ),
                        AnimatedDoubleField(
                          label: 'Total Price',
                          initialValue: totalValue!,
                        ),
                        AnimatedTextField(
                          label: 'Currency',
                          controller: currency,
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
                onTap: submitClaim,
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
