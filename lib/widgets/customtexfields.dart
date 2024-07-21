// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';

class AnimatedTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const AnimatedTextField(
      {super.key, required this.label, required this.controller});

  @override
  _AnimatedTextFieldState createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: widget.label,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedTextFieldInt extends StatefulWidget {
  final String label;
  final int initialValue; // Accept an integer value

  const AnimatedTextFieldInt(
      {Key? key, required this.label, required this.initialValue});

  @override
  _AnimatedTextFieldIntState createState() => _AnimatedTextFieldIntState();
}

class _AnimatedTextFieldIntState extends State<AnimatedTextFieldInt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextField(
                  controller: TextEditingController(
                      text:
                          widget.initialValue.toString()), // Set initial value
                  keyboardType: TextInputType.number, // Accept numeric input
                  decoration: InputDecoration(
                    hintText: widget.label,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedBooleanField extends StatefulWidget {
  final String label;
  bool initialValue; // Accept a boolean value

  AnimatedBooleanField(
      {Key? key, required this.label, required this.initialValue});

  @override
  _AnimatedBooleanFieldState createState() => _AnimatedBooleanFieldState();
}

class _AnimatedBooleanFieldState extends State<AnimatedBooleanField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: widget.initialValue,
                      onChanged: (newValue) {
                        // Handle checkbox value change
                        setState(() {
                          widget.initialValue = newValue ?? false;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(widget.label),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedDoubleField extends StatefulWidget {
  final String label;
  final double initialValue;

  const AnimatedDoubleField({
    Key? key,
    required this.label,
    required this.initialValue,
  }) : super(key: key);

  @override
  _AnimatedDoubleFieldState createState() => _AnimatedDoubleFieldState();
}

class _AnimatedDoubleFieldState extends State<AnimatedDoubleField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: TextField(
                  controller: TextEditingController(
                    text: widget.initialValue.toString(),
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: widget.label,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
