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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus gols'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("printou");
              },
              child: const Icon(Icons.calendar_month),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          context.push('/add_match');
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sports_soccer_outlined,
                size: 150,
                color: Colors.greenAccent,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatsPlayer(
                data: context.watch<MatchProvider>().goals,
                label: "gols",
                fontSize: 70,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatsPlayer(
                data: context.watch<MatchProvider>().assists,
                label: "assistências",
                fontSize: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => context.push('/matches'),
                  child: const Text('Partidas'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
