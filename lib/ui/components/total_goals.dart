import 'package:flutter/material.dart';

class StatsPlayer extends StatefulWidget {
  const StatsPlayer({super.key, required this.data, this.label, this.fontSize});
  final int? data;
  final String? label;
  final double? fontSize;

  @override
  State<StatsPlayer> createState() => _StatsPlayerState();
}

class _StatsPlayerState extends State<StatsPlayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Center(
        child: Text(
          '${widget.data} ${widget.label}',
           style: TextStyle(fontSize: widget.fontSize)
          )
      ),
    );
  }
}