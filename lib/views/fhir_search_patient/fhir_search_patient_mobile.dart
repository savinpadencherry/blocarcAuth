part of fhir_search_patient_view;

class _FhirSearchPatientMobile extends StatefulWidget {
  const _FhirSearchPatientMobile();

  @override
  State<_FhirSearchPatientMobile> createState() =>
      _FhirSearchPatientMobileState();
}

class _FhirSearchPatientMobileState extends State<_FhirSearchPatientMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.orange, // Orange background color
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Implement back button functionality
                },
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tale of', // Placeholder text
                    border: InputBorder.none, // Remove default border
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  // Implement search bar clear functionality
                },
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              // Implement search bar clear functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
