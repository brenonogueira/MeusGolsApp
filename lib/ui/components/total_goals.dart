import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TotalGoals extends StatefulWidget {
  const TotalGoals({super.key, required this.goals});
  final int? goals;

  @override
  State<TotalGoals> createState() => _TotalGoalsState();
}

class _TotalGoalsState extends State<TotalGoals> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Center(
        child: Text('${widget.goals.toString()} gols', style: TextStyle(fontSize: 70),)
      ),
    );
  }
}