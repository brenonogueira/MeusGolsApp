import 'package:flutter/material.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/types/gf_typography_type.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';

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
                      Center(
                      child: GFTypography(
                          dividerColor: Colors.lightGreenAccent,
                        text: "${matchInfo?.goals_amount.toString()} gols" ?? "Sem descrição",
                        textColor: Colors.white,
                        type: GFTypographyType.typo1,
                        icon: const Icon(Icons.sports_soccer),
                        
                      ),
                    ),
                     Center(
                      child: GFTypography(
                          dividerColor: Colors.lightGreenAccent,
                        text: "${matchInfo?.assists_amount.toString()} assistências" ?? "Sem descrição",
                         textColor: Colors.white,
                        type: GFTypographyType.typo1,
                        icon: const Icon(Icons.group),
                        
                      ),
                    ),

                     Center(
                      child: GFTypography(
                        dividerColor: Colors.lightGreenAccent,
                        text: "${matchInfo?.match_date.toString()}" ?? "00/00/2000",
                         textColor: Colors.white,
                        type: GFTypographyType.typo1,
                        icon: const Icon(Icons.date_range_rounded),
                        
                      ),
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
