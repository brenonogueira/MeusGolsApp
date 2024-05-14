import 'package:flutter/material.dart';
import 'package:meus_gols_app/ui/components/match_history.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Histórico de jogos")),
        body: MatchHistory(),
      ),
    );
  }
}
