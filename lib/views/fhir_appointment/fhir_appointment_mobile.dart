part of fhir_appointment_view;

class _FhirAppointmentMobile extends StatefulWidget {
  final AppointmentModel appointmentModel;
  const _FhirAppointmentMobile({required this.appointmentModel});

  @override
  State<_FhirAppointmentMobile> createState() => _FhirAppointmentMobileState();
}

class _FhirAppointmentMobileState extends State<_FhirAppointmentMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              backgroundColor: Colors.transparent,
              title: customText2(
                  'Information - ${widget.appointmentModel.patientName}'),
              centerTitle: true,
              // flexibleSpace: Hero(
              //   tag:
              //       '${widget.fhirPatientModel.patientFhirId}', // Same tag as in the previous page
              //   child: ClipRRect(
              //     borderRadius: const BorderRadius.only(
              //       bottomLeft: Radius.circular(25.0),
              //       bottomRight: Radius.circular(25.0),
              //     ),
              //     child: Image.network(
              //       '${widget.fhirPatientModel.photoUrl}',
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ),
          ];
        },
        body: ListView(
          children: [
            InfoTile(
              tite: 'Fhir ID Appointment',
              info: widget.appointmentModel.fhirId,
              left: false,
            ),
            InfoTile(
              tite: 'Status',
              info: widget.appointmentModel.status,
              left: true,
            ),
            InfoTile(
              tite: 'Act Display',
              info: widget.appointmentModel.actDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Act Code',
              info: widget.appointmentModel.actCode,
              left: true,
            ),
            InfoTile(
              tite: 'Appointment Type',
              info: widget.appointmentModel.appointmentTypeDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Appointment Type Code',
              info: widget.appointmentModel.appointmentTypeCode,
              left: true,
            ),
            InfoTile(
              tite: 'Description',
              info: widget.appointmentModel.description,
              left: false,
            ),
            InfoTile(
              tite: 'Location',
              info: widget.appointmentModel.location,
              left: true,
            ),
            InfoTile(
              tite: 'Note',
              info: widget.appointmentModel.note,
              left: false,
            ),
            InfoTile(
              tite: 'Instructions',
              info: widget.appointmentModel.patientInstructionText,
              left: true,
            ),
            InfoTile(
              tite: 'Practitioner Name',
              info: widget.appointmentModel.practitionerName,
              left: false,
            ),
            InfoTile(
              tite: 'Practitioner Status',
              info: widget.appointmentModel.practitionerStatus,
              left: true,
            ),
            InfoTile(
              tite: 'Reason',
              info: widget.appointmentModel.reasonDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Service Category',
              info: widget.appointmentModel.serviceCategoryDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Service Type ',
              info: widget.appointmentModel.serviceTypeDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Specialty',
              info: widget.appointmentModel.specialtyDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'type',
              info: widget.appointmentModel.type,
              left: false,
            ),
            InfoTile(
              tite: 'Specialty Code',
              info: widget.appointmentModel.specialtyCode,
              left: true,
            ),
            InfoTile(
              tite: 'Service Type',
              info: widget.appointmentModel.serviceTypeCode,
              left: false,
            ),
            InfoTile(
              tite: 'Service Category Code',
              info: widget.appointmentModel.serviceCategoryCode,
              left: true,
            ),
            InfoTile(
              tite: 'Start date',
              info: widget.appointmentModel.startDate,
              left: false,
            ),
          ],
        ),
      ),
    );
  }
}
