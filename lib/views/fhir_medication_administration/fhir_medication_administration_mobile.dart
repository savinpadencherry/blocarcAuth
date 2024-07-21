part of fhir_medication_administration_view;

class _FhirMedicationAdministrationMobile extends StatefulWidget {
  final MedicationAdministrationModel medicationAdministrationModel;
  const _FhirMedicationAdministrationMobile(
      {required this.medicationAdministrationModel});

  @override
  State<_FhirMedicationAdministrationMobile> createState() =>
      _FhirMedicationAdministrationMobileState();
}

class _FhirMedicationAdministrationMobileState
    extends State<_FhirMedicationAdministrationMobile> {
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
                  'Information - ${widget.medicationAdministrationModel.patientName}'),
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
              tite: 'Patient ID',
              info: widget.medicationAdministrationModel.patientId,
              left: false,
            ),
            InfoTile(
              tite: 'Encounter Display',
              info: widget.medicationAdministrationModel.encounterDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Medication ID',
              info: widget.medicationAdministrationModel.medicationId,
              left: false,
            ),
            InfoTile(
              tite: 'Medicine Name',
              info: widget.medicationAdministrationModel.medicineName,
              left: true,
            ),
            InfoTile(
              tite: 'Medicine Code',
              info: widget.medicationAdministrationModel.medicineCode,
              left: false,
            ),
            InfoTile(
              tite: 'Practitioner Name',
              info: widget.medicationAdministrationModel.practitionerName,
              left: true,
            ),
            InfoTile(
              tite: 'Administration Route',
              info: widget.medicationAdministrationModel.routeName,
              left: false,
            ),
            InfoTile(
              tite: 'Dosage Text',
              info: widget.medicationAdministrationModel.dosageText,
              left: true,
            ),
            InfoTile(
              tite: 'Dose Unit',
              info: widget.medicationAdministrationModel.doseUnit,
              left: false,
            ),
            InfoTile(
              tite: 'Dosage value',
              info: '${widget.medicationAdministrationModel.doseValue}',
              left: true,
            ),
            InfoTile(
              tite: 'Practitioner Name',
              info: widget.medicationAdministrationModel.practitionerName,
              left: false,
            ),
            InfoTile(
              tite: 'Medication Administration Id',
              info: widget
                  .medicationAdministrationModel.medicationAdministrationId,
              left: true,
            ),
            InfoTile(
              tite: 'Medication Administration Fhir Id',
              info: widget
                  .medicationAdministrationModel.medicationAdministrationFhirID,
              left: false,
            ),
          ],
        ),
      ),
    );
  }
}
