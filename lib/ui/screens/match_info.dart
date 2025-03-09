import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/ui/components/edit_match_dialog.dart';
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
  MatchSoccer? matchInfoData;
  bool isLoading = true;
   bool hasEdited = false; 

  @override
  void initState() {
    super.initState();
    _matchUseCase = MatchUseCase(_matchRepository);
    _loadMatchData();
  }

  void _loadMatchData() async {
    final match = await _matchUseCase.findMatchInfoById(int.parse(widget.id!));
    setState(() {
      matchInfoData = match;
      isLoading = false;
      hasEdited = true;
    });
  }

  void _onBackPressed() {
    context.pop(hasEdited);
  }

  void _openEditDialog() async {
    if (matchInfoData != null) {
      await showDialog<MatchSoccer>(
        context: context,
        builder: (context) => EditMatchDialog(match: matchInfoData!),
      ).then((updatedMatch) {
        setState(() {
          matchInfoData = updatedMatch;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes da Partida"),
         leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _onBackPressed,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: matchInfoData != null ? _openEditDialog : null,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : matchInfoData == null
                  ? const Center(child: Text("Nenhuma informação disponível"))
                  : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MatchInfoTypography(
                          matchInfo: matchInfoData!.fut_description,
                          icon: Icons.description,
                        ),
                        MatchInfoTypography(
                          matchInfo: "${matchInfoData!.goals_amount} gols",
                          icon: Icons.sports_soccer,
                        ),
                        MatchInfoTypography(
                          matchInfo:
                              "${matchInfoData!.assists_amount} assistências",
                          icon: Icons.group,
                        ),
                        MatchInfoTypography(
                          matchInfo: DatesUtils.formatDate(
                            matchInfoData!.match_date,
                          ),
                          icon: Icons.date_range_rounded,
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}
