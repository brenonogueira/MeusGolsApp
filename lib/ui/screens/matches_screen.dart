import 'package:flutter/material.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/ui/components/match_history.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final MatchRepository _matchRepository = MatchRepositoryImpl();
  late final MatchUseCase _matchUseCase;
  late List<MatchSoccer> matches = List.empty();

  @override
  void initState() {
    super.initState();
    _matchUseCase = MatchUseCase(_matchRepository);
    getAllHistory();
  }

  void getAllHistory() async {
    matches = await _matchUseCase.listMatches();
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
        appBar: AppBar(title: Text("Histórico de jogos")),
        body: MatchHistory(matchesList: matches),
      ),
    );
  }
}
