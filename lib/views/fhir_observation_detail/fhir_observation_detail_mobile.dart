part of fhir_observation_detail_view;

class _FhirObservationDetailMobile extends StatefulWidget {
  final ObservationModel observationModel;
  const _FhirObservationDetailMobile({required this.observationModel});

  @override
  State<_FhirObservationDetailMobile> createState() =>
      _FhirObservationDetailMobileState();
}

class _FhirObservationDetailMobileState
    extends State<_FhirObservationDetailMobile> {
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
                  'Information - ${widget.observationModel.patientName}'),
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
            // InfoTile(
            //   tite: 'Subject Id',
            //   left: false,
            //   info: widget.observationModel.patientId,
            // ),
            // InfoTile(
            //   tite: 'Fhir Id',
            //   info: widget.observationModel.patientFhirId,
            //   left: true,
            // ),
            InfoTile(
              tite: 'Patient Name',
              info: widget.observationModel.patientName,
              left: false,
            ),
            InfoTile(
              tite: 'Observation Id',
              info: widget.observationModel.observationId,
              left: true,
            ),
            InfoTile(
              tite: 'Condition',
              info: widget.observationModel.condition,
              left: false,
            ),
            InfoTile(
              tite: 'Condition Ids',
              info: widget.observationModel.conditionId,
              left: true,
            ),
            InfoTile(
              tite: 'Method Code',
              info: widget.observationModel.methodCode,
              left: false,
            ),
            InfoTile(
              tite: 'Method Text',
              info: widget.observationModel.methodText,
              left: true,
            ),
            InfoTile(
              tite: 'Value Quantity',
              info: widget.observationModel.valueQuantity,
              left: false,
            ),
            InfoTile(
              tite: 'Status',
              info: widget.observationModel.status,
              left: true,
            ),
            InfoTile(
              tite: 'Interpretation Code',
              info: widget.observationModel.interpretationCode,
              left: false,
            ),
            InfoTile(
              tite: 'Interpretation Text',
              info: widget.observationModel.interpretationDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Practitioner Name',
              info: widget.observationModel.practitionerName,
              left: false,
            ),
            InfoTile(
              tite: 'Practitioner Id',
              info: widget.observationModel.practitionerId,
              left: true,
            ),
            InfoTile(
              tite: 'Type Code',
              info: widget.observationModel.typeCode,
              left: false,
            ),
            InfoTile(
              tite: 'Type Display',
              left: true,
              info: widget.observationModel.typeDisplay,
            ),
            InfoTile(
              tite: 'Category Code',
              info: widget.observationModel.valueQuantity,
              left: false,
            ),
            InfoTile(
              tite: 'High Reference Range Value',
              info: widget.observationModel.highReferenceRangeCodeValue,
              left: true,
            ),
            InfoTile(
              tite: 'Low Reference Range Unit',
              info: widget.observationModel.highReferenceRangeUnitValue,
              left: false,
            ),
            InfoTile(
              tite: 'Low Reference Range Quantity',
              info: widget.observationModel.highReferenceRangeQuantityValue,
              left: true,
            ),
            InfoTile(
              tite: 'Low Reference Range Code',
              info: widget.observationModel.lowReferenceRangeCodeValue,
              left: false,
            ),
            InfoTile(
              tite: 'Low Reference Range Unit',
              info: widget.observationModel.lowReferenceRangeUnitValue,
              left: true,
            ),
            InfoTile(
              tite: 'Low Reference Range Quantity',
              info: widget.observationModel.lowReferenceRangeQuantityValue,
              left: false,
            ),
            InfoTile(
              tite: 'Observation Source',
              info: widget.observationModel.observationSource,
              left: true,
            ),
            InfoTile(
              tite: 'Observation FhirId',
              info: widget.observationModel.observationFhirId,
              left: false,
            ),
          ],
        ),
      ),
    );
  }
}
