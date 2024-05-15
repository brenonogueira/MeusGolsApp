import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meus_gols_app/ui/components/total_goals.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  
 final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Meus gols'),
          ),
          body: Column(
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
                       onPressed: () => context.go('/add_match'),
                      child: Text('Add match'),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(13.0),
                    child: ElevatedButton(
                      onPressed: () => context.go('/matches'),
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
