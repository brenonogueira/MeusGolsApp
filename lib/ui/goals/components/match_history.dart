import 'package:flutter/material.dart';

class MatchHistory extends StatefulWidget {
  const MatchHistory({super.key});

  @override
  State<MatchHistory> createState() => _MatchHistoryState();
}

class _MatchHistoryState extends State<MatchHistory> {
final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'I', 'J', 'K', 'L', 'M', 'N', '0'];
final List<int> colorCodes = <int>[600, 500, 100, 100];


  @override
  Widget build(BuildContext context) {
  
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return SizedBox(
    width: screenWidth,
    height: screenHeight * 0.6,
    child: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber,
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      }
    ),
  );
  }
}