// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fhirpat/core/contants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShadowedContainer extends StatefulWidget {
  Widget child;
  ShadowedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShadowedContainerState createState() => _ShadowedContainerState();
}

class _ShadowedContainerState extends State<ShadowedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              color: ConstantVars.maintheme,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
