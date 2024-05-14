import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TotalGoals extends StatefulWidget {
  const TotalGoals({super.key, required this.goals});
  final int goals;

  @override
  State<TotalGoals> createState() => _TotalGoalsState();
}

class _TotalGoalsState extends State<TotalGoals> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      height: 160,
      child: Center(
        child: Text("13 goals", style: TextStyle(fontSize: 40),)
      ),
    );
  }
}