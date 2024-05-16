import 'package:flutter/material.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';

class MatchProvider extends ChangeNotifier {
  final MatchUseCase _matchUseCase;

  MatchProvider(this._matchUseCase);

  // Métodos para acessar e manipular os dados das partidas
  Future<bool> saveMatch(MatchSoccer match) async {
    final result = await _matchUseCase.saveMatch(match);
    notifyListeners();
    return result;
  }

  Future<List<MatchSoccer>> listMatches() async {
    return await _matchUseCase.listMatches();
  }

  Future<int?> countGoals() async {
    return await _matchUseCase.countGoals();
  }

  Future<bool> deleteMatch(int id) async {
    final result = await _matchUseCase.deleteMatch(id);
    notifyListeners();
    return result;
  }
}