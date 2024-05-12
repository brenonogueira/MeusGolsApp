import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meus_gols_app/ui/goals/components/match_history.dart';
import 'package:meus_gols_app/ui/goals/components/total_goals.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  
 TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Meus gols'),
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TotalGoals(goals: 1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ElevatedButton(
                      onPressed: _handleButtonPress,
                      child: Text('Add match'),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ElevatedButton(
                      onPressed: _handleButtonPress,
                      child: Text('Matches'),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

void _handleButtonPress() {
  print('Botão pressionado!');
}
