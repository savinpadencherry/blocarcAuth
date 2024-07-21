part of fhir_medication_request_view;

class _FhirMedicationRequestMobile extends StatefulWidget {
  final MedicationRequestModel medicationRequestModel;
  const _FhirMedicationRequestMobile({required this.medicationRequestModel});

  @override
  State<_FhirMedicationRequestMobile> createState() =>
      _FhirMedicationRequestMobileState();
}

class _FhirMedicationRequestMobileState
    extends State<_FhirMedicationRequestMobile> {
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
                  'Information - ${widget.medicationRequestModel.patientName}'),
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
              info: widget.medicationRequestModel.patientId,
              left: false,
            ),
            InfoTile(
              tite: 'Medication Display',
              info: widget.medicationRequestModel.medicationDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Medication ID',
              info: widget.medicationRequestModel.medicationId,
              left: false,
            ),
            InfoTile(
              tite: 'Medicine Name',
              left: true,
              info: widget.medicationRequestModel.medicineName,
            ),
            InfoTile(
              left: false,
              tite: 'Medicine code',
              info: widget.medicationRequestModel.medicineCode,
            ),
            InfoTile(
              tite: 'Medication Request ID',
              info: widget.medicationRequestModel.medicationRequestId,
              left: true,
            ),
            InfoTile(
              tite: 'Status',
              info: widget.medicationRequestModel.status,
              left: false,
            ),
            InfoTile(
              tite: 'Authored On',
              info: widget.medicationRequestModel.authoredOnDate,
              left: true,
            ),
            InfoTile(
              tite: 'Dosage Instruction',
              info: widget.medicationRequestModel.dosageInstruction,
              left: false,
            ),
            InfoTile(
              tite: 'Dosage Instruction Code',
              info: widget.medicationRequestModel.dosageInstructionCode,
              left: true,
            ),
            InfoTile(
              tite: 'Dosage Instruction Text',
              info:
                  widget.medicationRequestModel.additionalDosageInstructionText,
              left: false,
            ),
            InfoTile(
              tite: 'Method Code',
              info: widget.medicationRequestModel.methodCode,
              left: true,
            ),
            InfoTile(
              tite: 'Method Text',
              info: widget.medicationRequestModel.methodText,
              left: false,
            ),
            InfoTile(
              tite: 'Practitioner Name',
              info: widget.medicationRequestModel.practitionerName,
              left: true,
            ),
            InfoTile(
              tite: 'Practitioner ID',
              info: widget.medicationRequestModel.practitionerId,
              left: false,
            ),
            InfoTile(
              tite: 'Reason',
              info: widget.medicationRequestModel.reasonDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Reason Code',
              info: widget.medicationRequestModel.reasonCode,
              left: false,
            ),
            InfoTile(
              tite: 'Administration Route',
              info: widget.medicationRequestModel.routeMessage,
              left: true,
            ),
            InfoTile(
              tite: 'Administration Route Code',
              info: widget.medicationRequestModel.routeCode,
              left: false,
            ),
            InfoTile(
              tite: 'Notes',
              info: widget.medicationRequestModel.notes,
              left: true,
            ),
            InfoTile(
              tite: 'Substitution Allowed',
              info: widget.medicationRequestModel.substitutionAllowedDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Substitution Allowed Code',
              info: widget.medicationRequestModel.substitutionAllowedCode,
              left: true,
            ),
            InfoTile(
              tite: 'Supporting Info',
              info: widget.medicationRequestModel.supportingInfoProcedure,
              left: false,
            ),
            InfoTile(
              tite: 'Intent',
              info: widget.medicationRequestModel.intent,
              left: true,
            ),
            InfoTile(
              tite: 'Dispense Request Quantity',
              info:
                  widget.medicationRequestModel.dispenseRequestNumberOfRequests,
              left: false,
            ),
            InfoTile(
              tite: 'Dispense Request Start Date',
              info: widget.medicationRequestModel.dispenseRequestStartDate,
              left: true,
            ),
            InfoTile(
              tite: 'Dispense Request End Date',
              info: widget.medicationRequestModel.dispenseRequestEndDate,
              left: false,
            ),
            InfoTile(
              tite: 'Dosage Range High Value',
              info: '${widget.medicationRequestModel.doseRangeHighValue}',
              left: true,
            ),
            InfoTile(
              tite: 'Dosage Range Low Value',
              info: '${widget.medicationRequestModel.doseRangeLowValue}',
              left: false,
            ),
            InfoTile(
              tite: 'Dosage Range Unit',
              info: widget.medicationRequestModel.doseRangeHighUnit,
              left: true,
            ),
            InfoTile(
              tite: 'Dosage Range Code',
              info:
                  '${widget.medicationRequestModel.doseRangeHighCode} - ${widget.medicationRequestModel.doseRangeLowCode}',
              left: false,
            ),
            InfoTile(
              tite: 'Frequency',
              info: '${widget.medicationRequestModel.frequency}',
              left: true,
            ),
            InfoTile(
              tite: 'Period',
              info: '${widget.medicationRequestModel.period}',
              left: false,
            ),
            InfoTile(
              tite: 'Encounter Id',
              info: widget.medicationRequestModel.encounterId,
              left: true,
            ),
            InfoTile(
              tite: 'Encounter Display',
              info: widget.medicationRequestModel.encounterDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Category Display',
              info: widget.medicationRequestModel.categoryDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Category Code',
              info: widget.medicationRequestModel.categoryCode,
              left: false,
            ),
            InfoTile(
              tite: 'When',
              info: widget.medicationRequestModel.when,
              left: true,
            ),
            InfoTile(
              tite: 'Expected Supply Duration',
              info:
                  '${widget.medicationRequestModel.expectedSupplyDurationValue}',
              left: false,
            ),
          ],
        ),
      ),
    );
  }
}
