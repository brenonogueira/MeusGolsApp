
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';

class MatchUseCase {
  final MatchRepository _matchRepository;

  MatchUseCase(this._matchRepository);

  Future<bool> saveMatch(MatchSoccer match) async {
    return await _matchRepository.addMatch(match);
  }

   Future<List<MatchSoccer>> listMatches() async {
      return await _matchRepository.findAll();     
   }

   Future<int?> countGoals() async {
      return await _matchRepository.countGoals();     
   }

   Future<int?> countAssists() async {
      return await _matchRepository.countAssists();     
   }

  Future<bool> deleteMatch(int id) async {
      return await _matchRepository.deleteMatchById(id);     
   }

   Future<MatchSoccer?> findMatchInfoById(int id) async {
      return await _matchRepository.findMatchById(id);     
   }
}