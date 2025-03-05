import 'package:flutter/material.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';

class MatchProvider extends ChangeNotifier {
  final MatchUseCase _matchUseCase;
  late int? goals = 0;
  late int? assists = 0;

  MatchProvider(this._matchUseCase);

  void changeGoalsValue() async {
    goals =  await _matchUseCase.countGoals();
    assists = await _matchUseCase.countAssists();
    notifyListeners();
  }
}