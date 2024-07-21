// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/logger.dart';
import 'package:fhirpat/core/services/navigator_service.dart';

import 'package:fhirpat/views/fhir_sequence_atient/fhir_sequence_atient_view.dart';
import 'package:flutter/material.dart';

import 'package:fhirpat/core/models/patient_model.dart';

class FhirPatientWidget extends StatefulWidget {
  final FhirPatientModel fhirPatientModel;
  const FhirPatientWidget({
    Key? key,
    required this.fhirPatientModel,
  }) : super(key: key);

  @override
  State<FhirPatientWidget> createState() => _FhirPatientWidgetState();
}

class _FhirPatientWidgetState extends State<FhirPatientWidget>
    with SingleTickerProviderStateMixin, LogMixin {
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
            FhirSequenceAtientView(
              fhirPatientModel: widget.fhirPatientModel,
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
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(widget.fhirPatientModel.photoUrl!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          widget.fhirPatientModel.patientNam,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            'FHIR ID: ${widget.fhirPatientModel.patientFhirId}'),
                        const SizedBox(height: 8),
                        Text('Email: ${widget.fhirPatientModel.patientEmail}'),
                        const SizedBox(height: 8),
                        Text('Phone: ${widget.fhirPatientModel.patientPhone}'),
                        const SizedBox(height: 8),
                        Text(
                            'Gender: ${widget.fhirPatientModel.patientGender}'),
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
