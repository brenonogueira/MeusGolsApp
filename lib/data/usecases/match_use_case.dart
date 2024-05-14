
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

}