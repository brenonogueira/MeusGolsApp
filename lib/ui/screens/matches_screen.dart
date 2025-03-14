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
    return Scaffold(
      appBar: AppBar(title: const Text("Partidas")),
      body: SafeArea(
        child: MatchHistory(
          matchesList: sortMatchesByDate(matches).reversed.toList(),
          getAllMatchs: getAllHistory,
        ),
      ),
    );
  }

  List<MatchSoccer> sortMatchesByDate(List<MatchSoccer> matches) {
    return matches..sort((a, b) {
      DateTime dataA = DateTime.parse(a.match_date);
      DateTime dataB = DateTime.parse(b.match_date);
      return dataA.compareTo(dataB);
    });
  }
}
