import 'package:flutter/material.dart';

class TextFieldGoal extends StatefulWidget {
  const TextFieldGoal({super.key});

  @override
  State<TextFieldGoal> createState() => _TextFieldGoalState();
}

class _TextFieldGoalState extends State<TextFieldGoal> {
  final TextEditingController _controller = TextEditingController();

 @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Enter a number',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}