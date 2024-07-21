part of patient_form_view;

class _PatientFormMobile extends StatefulWidget {
  const _PatientFormMobile();

  @override
  State<_PatientFormMobile> createState() => _PatientFormMobileState();
}

class _PatientFormMobileState extends State<_PatientFormMobile> with LogMixin {
  final TextEditingController _patientIdController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientEmailController = TextEditingController();
  final TextEditingController _patientPhoneController = TextEditingController();
  final TextEditingController _patientDobController = TextEditingController();
  final bool _deceased = false;
  final TextEditingController _patientCountryController =
      TextEditingController();
  final TextEditingController _patientManagingOrganizationCodeController =
      TextEditingController();
  final TextEditingController _patientRelationAddressController =
      TextEditingController();
  final TextEditingController _patientRelationFamilyNameController =
      TextEditingController();
  final TextEditingController _patientSuffixController =
      TextEditingController();
  final TextEditingController _patientGenderController =
      TextEditingController();
  final TextEditingController _patientFamilyNameController =
      TextEditingController();
  final TextEditingController _patientAddressController =
      TextEditingController();
  final TextEditingController _patientRelationController =
      TextEditingController();
  final TextEditingController _patientRelationPhoneController =
      TextEditingController();
  final TextEditingController _patientAddressLineController =
      TextEditingController();
  final TextEditingController _patientAddressCityController =
      TextEditingController();
  final TextEditingController _patientAddressPostCodeController =
      TextEditingController();
  final TextEditingController _patientAddressCountryController =
      TextEditingController();
  final TextEditingController _patientRelationGenderController =
      TextEditingController();
  final TextEditingController _patientCommunicationController =
      TextEditingController();
  final TextEditingController _patientGeneralPractitionerController =
      TextEditingController();
  final TextEditingController _patientManagingOrganizationController =
      TextEditingController();
  final TextEditingController _patientLinkController = TextEditingController();
  // final TextEditingController _countryCodeController = TextEditingController();
  File? _image;

  pickingImageGallery() async {
    final XFile? pickedImage =
        await app<FhirRepository>().handleGallerOpening();
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  pickingImageCamera() async {
    final XFile? pickedImage =
        await app<FhirRepository>().handlecameraOpening();
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  bool hasEmptyController() {
    final controllers = [
      _patientIdController,
      _patientNameController,
      _patientEmailController,
      _patientPhoneController,
      _patientDobController,
      _patientCountryController,
      _patientManagingOrganizationCodeController,
      _patientRelationAddressController,
      _patientRelationFamilyNameController,
      _patientSuffixController,
      _patientGenderController,
      _patientFamilyNameController,
      _patientAddressController,
      _patientRelationController,
      _patientRelationPhoneController,
      _patientAddressLineController,
      _patientAddressCityController,
      _patientAddressPostCodeController,
      _patientAddressCountryController,
      _patientRelationGenderController,
      _patientCommunicationController,
      _patientGeneralPractitionerController,
      _patientManagingOrganizationController,
      _patientLinkController,
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

  submitPatientDetails() {
    warningLog('function Called');
    context.read<FhirpatBloc>().add(
          FhirpatPatientEvent(
            patientId: _patientIdController.text,
            patientNam: _patientNameController.text,
            patientFamilyName: _patientFamilyNameController.text,
            patientPhone: _patientPhoneController.text,
            patientGender: _patientGenderController.text,
            patientAddressLine: _patientAddressLineController.text,
            patientAddressCity: _patientAddressCityController.text,
            patientAddressPostCode: _patientAddressPostCodeController.text,
            patientAddressCountry: _patientAddressCountryController.text,
            patientRelation: _patientRelationController.text,
            patientRelationFamilyName:
                _patientRelationFamilyNameController.text,
            patientRelationPhone: _patientRelationPhoneController.text,
            patientRelationAddress: _patientRelationAddressController.text,
            patientRelationGender: _patientRelationGenderController.text,
            patientCommunication: _patientCommunicationController.text,
            patientGeneralPractitioner:
                _patientGeneralPractitionerController.text,
            patientManagingOrganization:
                _patientManagingOrganizationController.text,
            patientLink: _patientLinkController.text,
            patientSuffix: _patientSuffixController.text,
            patientEmail: _patientEmailController.text,
            patientDoB: _patientDobController.text,
            countryCode: _patientCountryController.text,
            patientManagingOrganizationCode:
                _patientManagingOrganizationCodeController.text,
            deceased: _deceased,
            xfile: _image!,
          ),
        );
  }

  showErrorDialog(BuildContext context, String errorMessa) {
    showDialog(
        context: context,
        builder: (context) {
          return const CustomDialogBox(
            message: 'Error Creating patient resource , please try again',
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FhirpatBloc, FhirpatState>(listener: (context, state) {
      warningLog('$state');
      if (state is FhirPatientFhirIdReceivedState) {}
      if (state is FhirPatientErrorState) {
        showErrorDialog(context, state.message);
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Patient Form'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: 600,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: ConstantVars.cardColorTheme,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: customText2('Patient details'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/fhirlog.png',
                                    ), // Replace with your image path
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: _image != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.file(
                                          _image!,
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: 100,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                elevation:
                                                    8, // Add a subtle shadow
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(16),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                        'Choose an Option',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      ElevatedButton(
                                                        onPressed:
                                                            pickingImageCamera,
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .blue, // Button color
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                            'Take Photo from Camera'),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      ElevatedButton(
                                                        onPressed:
                                                            pickingImageGallery,
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .green, // Button color
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                            'Take Photo from Gallery'),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          // Handle "Cancel" action
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .red, // Button color
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.add),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedTextField(
                              label: 'Patient Suffix',
                              controller: _patientSuffixController),
                          AnimatedTextField(
                              label: 'Patient ID',
                              controller: _patientIdController),
                          AnimatedTextField(
                              label: 'Patient Name',
                              controller: _patientNameController),
                          AnimatedTextField(
                              label: 'Patient Phone',
                              controller: _patientPhoneController),
                          AnimatedTextField(
                              label: 'Patient Gender',
                              controller: _patientGenderController),
                          AnimatedTextField(
                              label: 'Patient Family Name',
                              controller: _patientFamilyNameController),
                          AnimatedTextField(
                              label: 'Patient DOB',
                              controller: _patientDobController),
                          AnimatedTextField(
                              label: 'Patient Email',
                              controller: _patientEmailController),
                          AnimatedTextField(
                              label: 'Patient Address Line',
                              controller: _patientAddressLineController),
                          AnimatedTextField(
                              label: 'Patient Address City',
                              controller: _patientAddressCityController),
                          AnimatedTextField(
                              label: 'Patient Address Country',
                              controller: _patientAddressCountryController),
                          AnimatedTextField(
                              label: 'Patient Address PostCode',
                              controller: _patientAddressPostCodeController),
                          AnimatedTextField(
                              label: 'Patient Relationship',
                              controller: _patientRelationController),
                          AnimatedTextField(
                              label: 'Patient Relation Phone',
                              controller: _patientRelationPhoneController),
                          AnimatedTextField(
                              label: 'Patient Relation Gender',
                              controller: _patientRelationGenderController),
                          AnimatedTextField(
                              label: 'Patient Relation Address',
                              controller: _patientAddressController),
                          AnimatedTextField(
                              label: 'Patient Relation Family Name',
                              controller: _patientRelationFamilyNameController),
                          AnimatedTextField(
                              label: 'Patient Communication',
                              controller: _patientCommunicationController),
                          AnimatedTextField(
                              label: 'General Practitioner',
                              controller:
                                  _patientGeneralPractitionerController),
                          AnimatedTextField(
                              label: 'Managing Organization',
                              controller:
                                  _patientManagingOrganizationController),
                          AnimatedTextField(
                              label: 'Managing Organization Code',
                              controller:
                                  _patientManagingOrganizationCodeController),
                          AnimatedTextField(
                            label: 'Patient Link',
                            controller: _patientLinkController,
                          ),
                          const SizedBox(
                            height: 24,
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
                  onTap: submitPatientDetails,
                  child: CustomContainer3(
                    title: state is FhirPatientLoadingState
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
            state is FhirPatientLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
          ],
        ),
      );
    });
  }
}
