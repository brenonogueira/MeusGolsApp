import 'package:flutter/material.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/ui/components/match_info_typography.dart';
import 'package:meus_gols_app/utils/date_utils.dart';

class MatchInfo extends StatefulWidget {
  const MatchInfo({super.key, required this.id});
  final String? id;

  @override
  State<MatchInfo> createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
  final MatchRepository _matchRepository = MatchRepositoryImpl();
  late final MatchUseCase _matchUseCase;
  late Future<MatchSoccer?> _matchFuture;

  @override
  void initState() {
    super.initState();
    _matchUseCase = MatchUseCase(_matchRepository);
    _matchFuture = _getMatchInfo();
  }

  Future<MatchSoccer?> _getMatchInfo() async {
    return await _matchUseCase.findMatchInfoById(int.parse(widget.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalhes da Partida")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<MatchSoccer?>(
            future: _matchFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text("Erro ao carregar os dados");
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Text("Nenhuma informação disponível");
              }

              final matchInfo = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MatchInfoTypography(
                      matchInfo: matchInfo.fut_description,
                      icon: Icons.description,
                    ),
                    MatchInfoTypography(
                      matchInfo: "${matchInfo.goals_amount.toString()} gols",
                      icon: Icons.sports_soccer,
                    ),
                    MatchInfoTypography(
                      matchInfo:
                          "${matchInfo.assists_amount.toString()} assistências",
                      icon: Icons.group,
                    ),
                    MatchInfoTypography(
                      matchInfo: DatesUtils.formatDate(matchInfo.match_date),
                      icon: Icons.date_range_rounded,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
