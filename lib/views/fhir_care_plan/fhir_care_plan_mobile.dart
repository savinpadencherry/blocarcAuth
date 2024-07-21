part of fhir_care_plan_view;

class _FhirCarePlanMobile extends StatefulWidget {
  final CarePlanModel carePlanModel;
  const _FhirCarePlanMobile({required this.carePlanModel});

  @override
  State<_FhirCarePlanMobile> createState() => _FhirCarePlanMobileState();
}

class _FhirCarePlanMobileState extends State<_FhirCarePlanMobile> {
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
                  'Information - ${widget.carePlanModel.patientName}'),
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
              info: widget.carePlanModel.patientId,
              left: false,
            ),
            InfoTile(
              tite: 'Status',
              info: widget.carePlanModel.status,
              left: true,
            ),
            InfoTile(
              tite: 'Intent',
              info: widget.carePlanModel.intent,
              left: false,
            ),
            InfoTile(
              tite: 'Practitioner Name',
              info: widget.carePlanModel.practitionerName,
              left: true,
            ),
            InfoTile(
              tite: 'Practitioner ID',
              info: widget.carePlanModel.practitionerId,
              left: false,
            ),
            InfoTile(
              tite: 'Care Plan ID',
              info: widget.carePlanModel.carePlanID,
              left: true,
            ),
            InfoTile(
              tite: 'Care Plan Fhir ID',
              info: widget.carePlanModel.careFhirID,
              left: false,
            ),
            InfoTile(
              tite: 'Condition Name',
              info: widget.carePlanModel.conditionName,
              left: true,
            ),
            InfoTile(
              tite: 'Note',
              info: widget.carePlanModel.note,
              left: false,
            ),
            InfoTile(
              tite: 'Activity Display',
              info: widget.carePlanModel.acitivityDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Achievement Status',
              info: widget.carePlanModel.achievementStatus,
              left: false,
            ),
            InfoTile(
              tite: 'Care Plan Intent',
              info: widget.carePlanModel.carePlanIntent,
              left: true,
            ),
            InfoTile(
              tite: 'Care Plan Status',
              info: widget.carePlanModel.carePlanStatus,
              left: false,
            ),
            InfoTile(
              tite: 'Description',
              info: widget.carePlanModel.descrption,
              left: true,
            ),
            InfoTile(
              tite: 'Start Period',
              info: widget.carePlanModel.startPeriod,
              left: false,
            ),
            InfoTile(
              tite: 'End Period',
              info: widget.carePlanModel.endPeriod,
              left: true,
            ),
            InfoTile(
              tite: 'Occurence Date',
              info: widget.carePlanModel.occurenceDate,
              left: false,
            ),
          ],
        ),
      ),
    );
  }
}
