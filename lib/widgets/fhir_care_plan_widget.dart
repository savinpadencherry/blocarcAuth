import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/careplan.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/views/fhir_care_plan/fhir_care_plan_view.dart';
import 'package:flutter/material.dart';

class FhirCarePlanWidget extends StatefulWidget {
  final CarePlanModel carePlanModel;
  const FhirCarePlanWidget({super.key, required this.carePlanModel});

  @override
  State<FhirCarePlanWidget> createState() => _FhirCarePlanWidgetState();
}

class _FhirCarePlanWidgetState extends State<FhirCarePlanWidget>
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
            FhirCarePlanView(
              carePlanModel: widget.carePlanModel,
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
                          widget.carePlanModel.conditionName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Status: ${widget.carePlanModel.status}'),
                        const SizedBox(height: 8),
                        Text('Intent: ${widget.carePlanModel.intent}'),
                        const SizedBox(height: 8),
                        Text(
                            'Activity Display: ${widget.carePlanModel.acitivityDisplay}'),
                        const SizedBox(height: 8),
                        Text(
                            'Practitioner Name: ${widget.carePlanModel.practitionerName}'),
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
