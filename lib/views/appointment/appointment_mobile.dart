part of appointment_view;

class _AppointmentMobile extends StatefulWidget {
  const _AppointmentMobile();

  @override
  State<_AppointmentMobile> createState() => _AppointmentMobileState();
}

class _AppointmentMobileState extends State<_AppointmentMobile> with LogMixin {
  final TextEditingController _actCodeController = TextEditingController();
  final TextEditingController _actDisplayController = TextEditingController();
  final TextEditingController _serviceCategoryCodeController =
      TextEditingController();
  final TextEditingController _serviceCategoryDisplayController =
      TextEditingController();
  final TextEditingController _serviceTypeCodeController =
      TextEditingController();
  final TextEditingController _serviceTypeDisplayController =
      TextEditingController();
  final TextEditingController _specialtyCodeController =
      TextEditingController();
  final TextEditingController _specialtyDisplayController =
      TextEditingController();
  final TextEditingController _appointmentTypeCodeController =
      TextEditingController();
  final TextEditingController _appointmentTypeDisplayController =
      TextEditingController();
  final TextEditingController _reasonDisplayController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _createdDateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _patientInstructionController =
      TextEditingController();
  final TextEditingController _serviceRequestController =
      TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientRequiredController =
      TextEditingController();
  final TextEditingController _patientStatusController =
      TextEditingController();
  final TextEditingController _practitionerStatusController =
      TextEditingController();
  final TextEditingController _practitionerNameController =
      TextEditingController();
  final TextEditingController _practitionerRequiredController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _locationRequiredController =
      TextEditingController();
  final TextEditingController _locationStatusController =
      TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  bool hasEmptyController() {
    final controllers = [
      _actCodeController,
      _actDisplayController,
      _serviceCategoryCodeController,
      _serviceCategoryDisplayController,
      _serviceTypeCodeController,
      _serviceTypeDisplayController,
      _specialtyCodeController,
      _specialtyDisplayController,
      _appointmentTypeCodeController,
      _appointmentTypeDisplayController,
      _reasonDisplayController,
      _descriptionController,
      _startDateController,
      _endDateController,
      _createdDateController,
      _noteController,
      _patientInstructionController,
      _serviceRequestController,
      _patientNameController,
      _patientRequiredController,
      _patientStatusController,
      _practitionerStatusController,
      _practitionerNameController,
      _practitionerRequiredController,
      _locationController,
      _locationRequiredController,
      _locationStatusController,
      _typeController,
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

  submitAppointment() {
    if (hasEmptyController()) {
      showEmptyFieldDialog(context);
    }
    context.read<FhirpatBloc>().add(
          FhirCreateAppointmentEvent(
            status: _patientStatusController.text,
            actCode: _actCodeController.text,
            actDisplay: _actDisplayController.text,
            serviceCategoryCode: _serviceCategoryCodeController.text,
            serviceCategoryDisplay: _serviceCategoryDisplayController.text,
            serviceTypeCode: _serviceTypeCodeController.text,
            serviceTypeDisplay: _serviceTypeDisplayController.text,
            specialtyCode: _specialtyCodeController.text,
            specialtyDisplay: _specialtyDisplayController.text,
            appointmentTypeCode: _appointmentTypeCodeController.text,
            appointmentTypeDisplay: _appointmentTypeDisplayController.text,
            reasonDisplay: _reasonDisplayController.text,
            description: _descriptionController.text,
            startDate: _startDateController.text,
            endDate: _endDateController.text,
            createdDate: _createdDateController.text,
            note: _noteController.text,
            patientInstructionText: _patientInstructionController.text,
            serviceRequest: _serviceRequestController.text,
            patientName: _patientNameController.text,
            patientRequired: _patientRequiredController.text,
            patientStatus: _patientStatusController.text,
            practitionerStatus: _practitionerStatusController.text,
            practitionerName: _practitionerNameController.text,
            practitionerRequired: _practitionerRequiredController.text,
            location: _locationController.text,
            locationRequired: _locationRequiredController.text,
            locationStatus: _locationStatusController.text,
            type: _typeController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FhirpatBloc, FhirpatState>(
      listener: (context, state) {
        warningLog('');
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
                          child: customText2('Appointment details'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AnimatedTextField(
                          label: 'Act Code',
                          controller: _actCodeController,
                        ),
                        AnimatedTextField(
                          label: 'Act Display',
                          controller: _actDisplayController,
                        ),
                        AnimatedTextField(
                          label: 'Service Category Code',
                          controller: _serviceCategoryCodeController,
                        ),
                        AnimatedTextField(
                          label: 'Service Category Display',
                          controller: _serviceCategoryDisplayController,
                        ),
                        AnimatedTextField(
                          label: 'Service Type Code',
                          controller: _serviceTypeCodeController,
                        ),
                        AnimatedTextField(
                          label: 'Service Type Display',
                          controller: _serviceTypeDisplayController,
                        ),
                        AnimatedTextField(
                          label: 'Specialty Code',
                          controller: _specialtyCodeController,
                        ),
                        AnimatedTextField(
                          label: 'Specialty Display',
                          controller: _specialtyDisplayController,
                        ),
                        AnimatedTextField(
                          label: 'Appointment Type Code',
                          controller: _appointmentTypeCodeController,
                        ),
                        AnimatedTextField(
                          label: 'Appointment Type Display',
                          controller: _appointmentTypeDisplayController,
                        ),
                        AnimatedTextField(
                          label: 'Reason Display',
                          controller: _reasonDisplayController,
                        ),
                        AnimatedTextField(
                          label: 'Description',
                          controller: _descriptionController,
                        ),
                        AnimatedTextField(
                          label: 'Start Date',
                          controller: _startDateController,
                        ),
                        AnimatedTextField(
                          label: 'End Date',
                          controller: _endDateController,
                        ),
                        AnimatedTextField(
                          label: 'Created Date',
                          controller: _createdDateController,
                        ),
                        AnimatedTextField(
                          label: 'Note',
                          controller: _noteController,
                        ),
                        AnimatedTextField(
                          label: 'Patient Instructions',
                          controller: _patientInstructionController,
                        ),
                        AnimatedTextField(
                          label: 'Service Request',
                          controller: _serviceRequestController,
                        ),
                        AnimatedTextField(
                          label: 'Patient Name',
                          controller: _patientNameController,
                        ),
                        AnimatedTextField(
                          label: 'Patient Required',
                          controller: _patientRequiredController,
                        ),
                        AnimatedTextField(
                          label: 'Patient Status',
                          controller: _patientStatusController,
                        ),
                        AnimatedTextField(
                          label: 'Practitioner Status',
                          controller: _practitionerStatusController,
                        ),
                        AnimatedTextField(
                          label: 'Practitioner Name',
                          controller: _practitionerNameController,
                        ),
                        AnimatedTextField(
                          label: 'Practitioner Required',
                          controller: _practitionerRequiredController,
                        ),
                        AnimatedTextField(
                          label: 'Location',
                          controller: _locationController,
                        ),
                        AnimatedTextField(
                          label: 'Location Required',
                          controller: _locationRequiredController,
                        ),
                        AnimatedTextField(
                          label: 'Location Status',
                          controller: _locationStatusController,
                        ),
                        AnimatedTextField(
                          label: 'Type',
                          controller: _typeController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: submitAppointment,
                child: CustomContainer3(
                  title: state is FhirCreateAppointmentLoadingState
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
