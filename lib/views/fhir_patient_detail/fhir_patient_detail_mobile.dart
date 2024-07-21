// ignore_for_file: public_member_api_docs, sort_constructors_first
part of fhir_patient_detail_view;

class _FhirPatientDetailMobile extends StatefulWidget {
  final FhirPatientModel fhirPatientModel;
  const _FhirPatientDetailMobile(Key? key, {required this.fhirPatientModel})
      : super(key: key);

  @override
  State<_FhirPatientDetailMobile> createState() =>
      _FhirPatientDetailMobileState();
}

class _FhirPatientDetailMobileState extends State<_FhirPatientDetailMobile>
    with LogMixin {
  @override
  Widget build(BuildContext context) {
    warningLog('Name of the patient ${widget.fhirPatientModel.patientNam}');
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              backgroundColor: Colors.transparent,
              title: customText2(
                  'Information - ${widget.fhirPatientModel.patientNam}'),
              centerTitle: true,
              flexibleSpace: Hero(
                tag:
                    '${widget.fhirPatientModel.patientFhirId}', // Same tag as in the previous page
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  child: Image.network(
                    '${widget.fhirPatientModel.photoUrl}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: [
            InfoTile(
              tite: 'Subject Id',
              left: false,
              info: widget.fhirPatientModel.patientId,
            ),
            InfoTile(
              tite: 'Fhir Id',
              info: widget.fhirPatientModel.patientFhirId,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Name',
              info: widget.fhirPatientModel.patientNam,
              left: false,
            ),
            InfoTile(
              tite: 'Patient phone',
              info: widget.fhirPatientModel.patientPhone,
              left: true,
            ),
            InfoTile(
              tite: 'Patient email',
              info: widget.fhirPatientModel.patientEmail,
              left: false,
            ),
            InfoTile(
              tite: 'Patient Family Name',
              info: widget.fhirPatientModel.patientFamilyName,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Source',
              info: widget.fhirPatientModel.source,
              left: false,
            ),
            InfoTile(
              tite: 'Patient Birthdate',
              info: widget.fhirPatientModel.patientDoB,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Communication',
              info: widget.fhirPatientModel.patientCommunication,
              left: false,
            ),
            InfoTile(
              tite: 'Patient Address Line',
              info: widget.fhirPatientModel.patientAddressLine,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Address City',
              info: widget.fhirPatientModel.patientAddressCity,
              left: false,
            ),
            InfoTile(
              tite: 'Patient Address PostCode',
              info: widget.fhirPatientModel.patientAddressPostCode,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Address Country',
              info: widget.fhirPatientModel.patientAddressCountry,
              left: false,
            ),
            InfoTile(
              tite: 'Patient Relation',
              info: widget.fhirPatientModel.patientRelation,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Relation Name',
              info: widget.fhirPatientModel.patientRelationFamilyName,
              left: false,
            ),
            InfoTile(
              tite: 'Patient Relation Address',
              info: widget.fhirPatientModel.patientRelationAddress,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Relation Phone',
              info: widget.fhirPatientModel.patientRelationPhone,
              left: false,
            ),
            InfoTile(
              tite: 'Patient General Practitioner',
              info: widget.fhirPatientModel.patientGeneralPractitioner,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Managing Organization',
              info: widget.fhirPatientModel.patientManagingOrganization,
              left: false,
            ),
            InfoTile(
              tite: 'Patient Managing Organization Code',
              info: widget.fhirPatientModel.patientManagingOrganizationCode,
              left: true,
            ),
            InfoTile(
              tite: 'Patient Link',
              info: widget.fhirPatientModel.patientLink,
              left: false,
            ),
          ],
        ),
      ),
    );
  }
}
