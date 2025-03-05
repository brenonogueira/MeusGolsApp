import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meus_gols_app/data/provider_service/match_provider.dart';
import 'package:meus_gols_app/ui/components/total_goals.dart';
import 'package:provider/provider.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  
 final TextEditingController _controller = TextEditingController();
  int? goals;

@override
  void initState() {
    super.initState();
     context.read<MatchProvider>().changeGoalsValue();
  }

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
                  Icon(Icons.sports_soccer_outlined, size: 150, color: Colors.greenAccent,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatsPlayer(data: context.watch<MatchProvider>().goals, label: "goals", fontSize: 70),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   StatsPlayer(data: context.watch<MatchProvider>().assists, label: "assists", fontSize: 30),
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
