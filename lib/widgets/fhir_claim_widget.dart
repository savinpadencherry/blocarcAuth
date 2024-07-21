import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/claimmodel.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/views/fhir_claim/fhir_claim_view.dart';
import 'package:flutter/material.dart';

class FhirClaimWidget extends StatefulWidget {
  final ClaimDataModel claimDataModel;
  const FhirClaimWidget({super.key, required this.claimDataModel});

  @override
  State<FhirClaimWidget> createState() => _FhirClaimWidgetState();
}

class _FhirClaimWidgetState extends State<FhirClaimWidget>
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
            FhirClaimView(
              claimDataModel: widget.claimDataModel,
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
                          widget.claimDataModel.insurerDisplay,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Status: ${widget.claimDataModel.status}'),
                        const SizedBox(height: 8),
                        Text(
                            'Coverage Type: ${widget.claimDataModel.coverageTypeDisplay}'),
                        const SizedBox(height: 8),
                        Text(
                            'Diagnosis Display: ${widget.claimDataModel.diagnosisDisplay}'),
                        const SizedBox(height: 8),
                        Text(
                            'Insurer Name: ${widget.claimDataModel.insurerDisplay}'),
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
