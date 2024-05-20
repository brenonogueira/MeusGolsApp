import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/provider_service/match_provider.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/utils/date_utils.dart';
import 'package:provider/provider.dart';

class MatchHistory extends StatefulWidget {
  const MatchHistory(
      {super.key, required this.matchesList, required this.getAllMatchs});
  final List<MatchSoccer> matchesList;
  final Function getAllMatchs;

  @override
  State<MatchHistory> createState() => _MatchHistoryState();
}

class _MatchHistoryState extends State<MatchHistory> {
  final MatchRepository _matchRepository = MatchRepositoryImpl();
  late final MatchUseCase _matchUseCase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       initializeDateFormatting();
    _matchUseCase = MatchUseCase(_matchRepository);
  }

  @override
  Widget build(BuildContext context) {
    return widget.matchesList.isNotEmpty
        ? ListView.builder(
            itemCount: widget.matchesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                confirmDismiss: (direction) async {
                return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text("Deseja mesmo deletar esta partida?"),
              ),
            );
          },
        );
                },
                background: Container(
                  width: 10,
                  color: Colors.red,
                  child: Icon(Icons.delete),
                ),
                onDismissed: (direction) => _matchUseCase
                    .deleteMatch(widget.matchesList[index].id!)
                    .then((value) => {
                          if (value)
                            {
                              showCustomSnackbar(
                                  context, 'Partida deletada com sucesso!'),
                              widget.getAllMatchs(),
                              context.read<MatchProvider>().changeGoalsValue()
                            }
                        }),
                key: ValueKey<int>(widget.matchesList[index].id!),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.sports_soccer_sharp, size: 40),
                    title: Text(widget.matchesList[index].fut_description),
                    subtitle: Text(DatesUtils.formatDate(widget.matchesList[index].match_date)),
                    trailing: Text(
                        widget.matchesList[index].goals_amount.toString(),
                        style: const TextStyle(fontSize: 40)),
                  ),
                ),
              );
            })
        : const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Center(child: Text("Nenhum jogo registrado!"))],
          );
  }
}

void showCustomSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text(message),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
