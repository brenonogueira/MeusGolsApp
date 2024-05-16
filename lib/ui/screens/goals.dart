import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/ui/components/total_goals.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  
 final TextEditingController _controller = TextEditingController();
  int? goals;
  final MatchRepository _matchRepository = MatchRepositoryImpl();
	late final MatchUseCase _matchUseCase;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
     _matchUseCase = MatchUseCase(_matchRepository);
     getGoalsCount();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void getGoalsCount() async {
    goals = await _matchUseCase.countGoals();
    setState(() {
      // fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Meus gols'),
            actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Chame a função desejada aqui
              getGoalsCount();
            },
          ),
        ],
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
                  TotalGoals(goals: goals),
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
