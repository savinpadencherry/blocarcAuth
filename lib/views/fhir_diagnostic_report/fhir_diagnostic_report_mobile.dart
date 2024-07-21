part of fhir_diagnostic_report_view;

class _FhirDiagnosticReportMobile extends StatefulWidget {
  final DiagnosticReportModel diagnosticReportModel;
  const _FhirDiagnosticReportMobile({required this.diagnosticReportModel});

  @override
  State<_FhirDiagnosticReportMobile> createState() =>
      _FhirDiagnosticReportMobileState();
}

class _FhirDiagnosticReportMobileState
    extends State<_FhirDiagnosticReportMobile> {
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
                  'Information - ${widget.diagnosticReportModel.patientName}'),
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
              tite: 'Patient Name',
              info: widget.diagnosticReportModel.patientName,
              left: true,
            ),
            InfoTile(
              tite: 'Status',
              info: widget.diagnosticReportModel.status,
              left: false,
            ),
            InfoTile(
              tite: 'Issued Date',
              info: widget.diagnosticReportModel.issued,
              left: true,
            ),
            InfoTile(
              tite: 'Diagnostic Report ID',
              info: widget.diagnosticReportModel.diagonisticReportId,
              left: false,
            ),
            InfoTile(
              tite: 'Diagnostic Report Status',
              info: widget.diagnosticReportModel.diagonisticReportStatus,
              left: true,
            ),
            InfoTile(
              tite: 'Diagnostic Report Study Type',
              info: widget.diagnosticReportModel.diagonisticReportStudyType,
              left: false,
            ),
            InfoTile(
              tite: 'Diagnostic Report Study Id',
              info: widget.diagnosticReportModel.diagonisticReportStudyId,
              left: true,
            ),
            InfoTile(
              tite: 'Diagnostic Report Study FhirID',
              info: widget.diagnosticReportModel.diagonisticReportFhirId,
              left: false,
            ),
            InfoTile(
              tite: 'Conclusion Display',
              info: widget.diagnosticReportModel.conclusionDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Conclusion',
              info: widget.diagnosticReportModel.conclusion,
              left: false,
            ),
            InfoTile(
              tite: 'Category Display',
              info: widget.diagnosticReportModel.categoryDisplay,
              left: true,
            ),
            InfoTile(
              tite: 'Conclusion Display',
              info: widget.diagnosticReportModel.conclusionDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Category Code',
              info: widget.diagnosticReportModel.categoryCode,
              left: true,
            ),
            InfoTile(
              tite: 'Type Of Diagnostic Test',
              info: widget.diagnosticReportModel.typeOfDiagnosticTestDisplay,
              left: false,
            ),
            InfoTile(
              tite: 'Type Of Diagnostic Test Code',
              info: widget.diagnosticReportModel.typeOfDiagnosticTestCode,
              left: true,
            ),
            InfoTile(
              tite: 'Organization Name',
              info: widget.diagnosticReportModel.organizationName,
              left: false,
            ),
            InfoTile(
              tite: 'Organization ID',
              info: widget.diagnosticReportModel.organizationId,
              left: true,
            ),
            InfoTile(
              tite: 'Description',
              info: widget.diagnosticReportModel.description,
              left: false,
            ),
          ],
        ),
      ),
    );
  }
}
