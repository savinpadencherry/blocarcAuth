import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/medication_administration_model.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/views/fhir_medication_administration/fhir_medication_administration_view.dart';
import 'package:flutter/material.dart';

class MedicationAdministrationWidget extends StatefulWidget {
  final MedicationAdministrationModel medicationAdministrationModel;
  const MedicationAdministrationWidget(
      {super.key, required this.medicationAdministrationModel});

  @override
  State<MedicationAdministrationWidget> createState() =>
      _MedicationAdministrationWidgetState();
}

class _MedicationAdministrationWidgetState
    extends State<MedicationAdministrationWidget>
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
            FhirMedicationAdministrationView(
              medicationAdministrationModel:
                  widget.medicationAdministrationModel,
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
                          widget.medicationAdministrationModel.medicineName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            'Status: ${widget.medicationAdministrationModel.status}'),
                        const SizedBox(height: 8),
                        Text(
                            'Encounter Text: ${widget.medicationAdministrationModel.encounterDisplay}'),
                        const SizedBox(height: 8),
                        Text(
                            'Administration Route: ${widget.medicationAdministrationModel.routeName}'),
                        const SizedBox(height: 8),
                        Text(
                            'Practitioner Name: ${widget.medicationAdministrationModel.practitionerName}'),
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
