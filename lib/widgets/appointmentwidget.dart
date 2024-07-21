import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/appointmentmodel.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/views/fhir_appointment/fhir_appointment_view.dart';
import 'package:flutter/material.dart';

class FhirAppointmentWidget extends StatefulWidget {
  final AppointmentModel appointmentModel;
  const FhirAppointmentWidget({super.key, required this.appointmentModel});

  @override
  State<FhirAppointmentWidget> createState() => _FhirAppointmentWidgetState();
}

class _FhirAppointmentWidgetState extends State<FhirAppointmentWidget>
    with TickerProviderStateMixin {
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
            FhirAppointmentView(
              appointmentModel: widget.appointmentModel,
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
                          widget.appointmentModel.appointmentTypeDisplay,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Status: ${widget.appointmentModel.status}'),
                        const SizedBox(height: 8),
                        Text(
                            'Act Display: ${widget.appointmentModel.actDisplay}'),
                        const SizedBox(height: 8),
                        Text(
                            'Service Category: ${widget.appointmentModel.serviceCategoryDisplay}'),
                        const SizedBox(height: 8),
                        Text(
                            'SpecialtyDisplay: ${widget.appointmentModel.specialtyDisplay}'),
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
