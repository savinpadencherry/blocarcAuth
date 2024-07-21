part of fhir_sequence_atient_view;

class _FhirSequenceAtientMobile extends StatefulWidget {
  final FhirPatientModel fhirPatientModel;
  const _FhirSequenceAtientMobile({required this.fhirPatientModel});

  @override
  State<_FhirSequenceAtientMobile> createState() =>
      _FhirSequenceAtientMobileState();
}

class _FhirSequenceAtientMobileState extends State<_FhirSequenceAtientMobile> {
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
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirPatientDetailView(
                      fhirPatientModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(
                    child:
                        Text('Patient', style: TextStyle(color: Colors.white))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirObservationListView(
                      patientModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.green,
                child: const Center(
                    child: Text('Observation',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirAppointmentListView(
                      fhirPatientModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.orange,
                child: const Center(
                    child: Text('Appointment',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirCarePlanListView(
                      fhirPatientModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.purple,
                child: const Center(
                    child: Text('Care Plan',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirMedicationListView(
                      fhirPatientModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.red,
                child: const Center(
                    child: Text('Medication Request',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirMedicationAdministrationListView(
                      patientModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.teal,
                child: const Center(
                    child: Text('Medication Administration',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirDiagnosticReportListView(
                      diagnosticReportModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.yellow,
                child: const Center(
                    child: Text('Diagnostic Report',
                        style: TextStyle(color: Colors.black))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FhirClaimListView(
                      fhirPatientModel: widget.fhirPatientModel,
                    ),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                height: 100,
                width: double.infinity,
                color: Colors.grey,
                child: const Center(
                    child:
                        Text('Claim', style: TextStyle(color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
