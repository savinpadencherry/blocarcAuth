// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fhirpat/core/contants.dart';
import 'package:flutter/material.dart';

class InfoTile extends StatefulWidget {
  final String tite;
  final String? info;
  final bool left;
  const InfoTile({
    Key? key,
    required this.tite,
    this.info,
    required this.left,
  }) : super(key: key);

  @override
  State<InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 1), // Set your desired animation duration
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start from left (off-screen)
      end: const Offset(0.0, 0.0), // End at the center
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        height: 100,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: ConstantVars.maintheme,
            borderRadius: BorderRadius.only(
              bottomLeft: widget.left
                  ? const Radius.circular(80.0)
                  : const Radius.circular(0),
              bottomRight: widget.left
                  ? const Radius.circular(0)
                  : const Radius.circular(80),
            ),
            boxShadow: [
              BoxShadow(
                color: ConstantVars.maintheme.withOpacity(0.3),
                offset: const Offset(-10.0, 8.0),
                blurRadius: 28.0,
                spreadRadius: 4.8,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.tite,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.info}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
