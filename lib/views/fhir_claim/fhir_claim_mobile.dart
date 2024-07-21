part of fhir_claim_view;

class _FhirClaimMobile extends StatefulWidget {
  final ClaimDataModel claimDataModel;
  const _FhirClaimMobile({required this.claimDataModel});

  @override
  State<_FhirClaimMobile> createState() => _FhirClaimMobileState();
}

class _FhirClaimMobileState extends State<_FhirClaimMobile> {
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
                  'Information - ${widget.claimDataModel.patientName}'),
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
              left: true,
              info: widget.claimDataModel.patientId,
            ),
            InfoTile(
              tite: 'Claim ID',
              left: false,
              info: widget.claimDataModel.claimID,
            ),
            InfoTile(
              tite: 'Claim Type',
              left: true,
              info: widget.claimDataModel.classValue,
            ),
            InfoTile(
              tite: 'Claim Status',
              left: false,
              info: widget.claimDataModel.status,
            ),
            InfoTile(
              tite: 'Coverage ID',
              left: true,
              info: widget.claimDataModel.coverageId,
            ),
            InfoTile(
              tite: 'Coverage Type',
              left: false,
              info: widget.claimDataModel.coverageTypeDisplay,
            ),
            InfoTile(
              tite: 'Insurer Name',
              left: true,
              info: widget.claimDataModel.insurerDisplay,
            ),
            InfoTile(
              tite: 'Diagnosis Display',
              left: false,
              info: widget.claimDataModel.diagnosisDisplay,
            ),
            InfoTile(
              tite: 'Insurer Id',
              left: true,
              info: widget.claimDataModel.insurerId,
            ),
            InfoTile(
              tite: 'Patient Name',
              left: false,
              info: widget.claimDataModel.patientName,
            ),
            InfoTile(
              tite: 'Patient Phone Number',
              left: true,
              info: widget.claimDataModel.patientPhoneNumber,
            ),
            InfoTile(
              tite: 'Patient Email',
              left: false,
              info: widget.claimDataModel.patientEmail,
            ),
            InfoTile(
              tite: 'Patient Address',
              left: true,
              info: widget.claimDataModel.patientAddress,
            ),
            InfoTile(
              tite: 'Coverage Type Display',
              left: false,
              info: widget.claimDataModel.coverageTypeDisplay,
            ),
            InfoTile(
              tite: 'Diagnostic Display',
              left: true,
              info: widget.claimDataModel.diagnosisDisplay,
            ),
            InfoTile(
              tite: 'Location Display',
              left: false,
              info: widget.claimDataModel.locationDisplay,
            ),
            InfoTile(
              tite: 'Practitioner Name',
              left: true,
              info: widget.claimDataModel.practitionerName,
            ),
            InfoTile(
              tite: 'Priority Code',
              left: false,
              info: widget.claimDataModel.priorityCode,
            ),
            InfoTile(
              tite: 'Service Display',
              left: true,
              info: widget.claimDataModel.serviceDisplay,
            ),
            InfoTile(
              tite: 'Service Code',
              left: false,
              info: widget.claimDataModel.serviceCode,
            ),
            InfoTile(
              tite: 'Service Date',
              left: true,
              info: widget.claimDataModel.servicedDate,
            ),
            InfoTile(
              tite: 'Sub Type',
              left: false,
              info: widget.claimDataModel.subTypeName,
            ),
            InfoTile(
              tite: 'Sub Type Code',
              left: true,
              info: widget.claimDataModel.subTypeCode,
            ),
            InfoTile(
              tite: 'Type Code',
              left: false,
              info: widget.claimDataModel.typeCode,
            ),
            InfoTile(
              tite: 'Use',
              left: true,
              info: widget.claimDataModel.use,
            ),
            InfoTile(
              tite: 'Claim Fhir ID',
              left: false,
              info: widget.claimDataModel.fhirId,
            ),
            InfoTile(
              tite: 'Start Date',
              left: true,
              info: widget.claimDataModel.startDate,
            ),
            InfoTile(
              tite: 'Currency',
              left: false,
              info: widget.claimDataModel.currency,
            ),
            InfoTile(
              tite: 'Unit Price',
              left: true,
              info: '${widget.claimDataModel.unitPrice}',
            ),
            InfoTile(
              tite: 'Net Price',
              left: false,
              info: '${widget.claimDataModel.netValue}',
            ),
            InfoTile(
              tite: 'Total Price',
              left: true,
              info: '${widget.claimDataModel.totalValue}',
            ),
            InfoTile(
              tite: 'Source',
              left: false,
              info: widget.claimDataModel.source,
            ),
          ],
        ),
      ),
    );
  }
}
