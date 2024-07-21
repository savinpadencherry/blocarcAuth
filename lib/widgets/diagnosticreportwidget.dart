import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/models/diagonisticreport.dart';
import 'package:fhirpat/core/services/navigator_service.dart';
import 'package:fhirpat/views/fhir_diagnostic_report/fhir_diagnostic_report_view.dart';
import 'package:flutter/material.dart';

class DiagnosticReportWidget extends StatefulWidget {
  final DiagnosticReportModel diagnosticReportModel;
  const DiagnosticReportWidget(
      {super.key, required this.diagnosticReportModel});

  @override
  State<DiagnosticReportWidget> createState() => _DiagnosticReportWidgetState();
}

class _DiagnosticReportWidgetState extends State<DiagnosticReportWidget>
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
            FhirDiagnosticReportView(
              diagnosticReportModel: widget.diagnosticReportModel,
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
                          widget.diagnosticReportModel.patientName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Status: ${widget.diagnosticReportModel.status}'),
                        const SizedBox(height: 8),
                        Text(
                            'Diagnoistic Report Study: ${widget.diagnosticReportModel.diagonisticReportStudyType}'),
                        const SizedBox(height: 8),
                        Text(
                            'Service Category: ${widget.diagnosticReportModel.categoryDisplay}'),
                        const SizedBox(height: 8),
                        Text(
                            'Organization Name: ${widget.diagnosticReportModel.organizationName}'),
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
