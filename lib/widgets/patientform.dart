import 'package:fhirpat/core/logger.dart';
import 'package:flutter/material.dart';

class PatientForm extends StatefulWidget {
  const PatientForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> with LogMixin {
  final TextEditingController _patientIdController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientPhoneController = TextEditingController();
  final TextEditingController _patientGenderController =
      TextEditingController();
  final TextEditingController _patientAddressController =
      TextEditingController();
  final TextEditingController _patientPhotoController = TextEditingController();
  final TextEditingController _patientRelationController =
      TextEditingController();
  final TextEditingController _patientRelationPhoneController =
      TextEditingController();
  final TextEditingController _patientRelationAddressController =
      TextEditingController();
  final TextEditingController _patientRelationGenderController =
      TextEditingController();
  final TextEditingController _patientCommunicationController =
      TextEditingController();
  final TextEditingController _patientGeneralPractitionerController =
      TextEditingController();
  final TextEditingController _patientManagingOrganizationController =
      TextEditingController();
  final TextEditingController _patientLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField('Patient ID', _patientIdController),
            _buildTextField('Patient Name', _patientNameController),
            _buildTextField('Patient Phone', _patientPhoneController),
            _buildTextField('Patient Gender', _patientGenderController),
            _buildTextField('Patient Address', _patientAddressController),
            _buildTextField('Patient Photo', _patientPhotoController),
            _buildTextField('Patient Relationship', _patientRelationController),
            _buildTextField(
                'Patient Relation Phone', _patientRelationPhoneController),
            _buildTextField(
                'Patient Relation Address', _patientRelationAddressController),
            _buildTextField(
                'Patient Relation Gender', _patientRelationGenderController),
            _buildTextField(
                'Patient Communication', _patientCommunicationController),
            _buildTextField(
                'General Practitioner', _patientGeneralPractitionerController),
            _buildTextField('Managing Organization',
                _patientManagingOrganizationController),
            _buildTextField('Patient Link', _patientLinkController),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                // Add other fields as needed
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
