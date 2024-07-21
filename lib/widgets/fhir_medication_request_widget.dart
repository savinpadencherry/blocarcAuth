// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/views/fhir_medication_request/fhir_medication_request_view.dart';
import 'package:flutter/material.dart';

import 'package:fhirpat/core/models/medication_request_model.dart';

class FhirMedicationRequestWidget extends StatefulWidget {
  final MedicationRequestModel medicationRequestModel;
  const FhirMedicationRequestWidget({
    Key? key,
    required this.medicationRequestModel,
  }) : super(key: key);

  @override
  State<FhirMedicationRequestWidget> createState() =>
      _FhirMedicationRequestWidgetState();
}

class _FhirMedicationRequestWidgetState
    extends State<FhirMedicationRequestWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Slide from top
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animateCard();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animateCard() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () {
          app<NavigatorService>().buildAndPush(
            FhirMedicationRequestView(
              medicationRequestModel: widget.medicationRequestModel,
            ),
          );
        },
        child: SlideTransition(
          position: _slideAnimation,
          child: SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Text(
                        'O',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          widget.medicationRequestModel.medicationDisplay,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            'medication ID: ${widget.medicationRequestModel.medicationId}'),
                        const SizedBox(height: 8),
                        Text(
                            'Dosage Instruction: ${widget.medicationRequestModel.dosageInstruction}'),
                        const SizedBox(height: 8),
                        Text(
                            'Patient Name: ${widget.medicationRequestModel.patientName}'),
                        const SizedBox(height: 8),
                        Text(
                            'Practitioner Name: ${widget.medicationRequestModel.practitionerName}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
