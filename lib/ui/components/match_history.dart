import 'package:flutter/material.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';

class MatchHistory extends StatefulWidget {
  const MatchHistory({super.key, required this.matchesList});
  final List<MatchSoccer> matchesList;

  @override
  State<MatchHistory> createState() => _MatchHistoryState();
}

class _MatchHistoryState extends State<MatchHistory> {

  @override
  Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: widget.matchesList.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          leading: const Icon(Icons.sports_soccer_sharp, size: 40),
          title: Text(widget.matchesList[index].fut_description),
          subtitle: Text(widget.matchesList[index].match_date),
          trailing: Text(widget.matchesList[index].goals_amount.toString(), style: const TextStyle(fontSize: 40)),
        ),
      );
    }
  ) ;
  }
}