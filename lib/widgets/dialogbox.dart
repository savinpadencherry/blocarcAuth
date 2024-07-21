// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fhirpat/core/get.dart';
import 'package:fhirpat/core/services/navigator_service.dart';

class CustomDialogBox extends StatefulWidget {
  final String? message;
  const CustomDialogBox({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Center(
        child: Text(
          'Error Message',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      contentPadding: const EdgeInsets.only(top: 20),
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(widget.message!),
            ),
            const SizedBox(
              height: 22,
            ),
            InkWell(
              onTap: () => app<NavigatorService>().pop(),
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: const Text(
                  "Exit",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
