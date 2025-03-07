import 'package:meus_gols_app/data/models/match_soccer.dart';

abstract class MatchRepository {
  Future<List<MatchSoccer>> findAll();
  Future<MatchSoccer?> findMatchById(int id);
  Future<bool> addMatch(MatchSoccer matchSoccer);
  Future<void> updateMatch(MatchSoccer match, int id);
  Future<bool> deleteMatchById(int id);
  Future<int?> countGoals();
  Future<int?> countAssists();
}
