import 'package:meus_gols_app/data/models/match_soccer.dart';

abstract class MatchRepository {
  Future<List<MatchSoccer>> findAll();
  Future<void> addMatch(MatchSoccer matchSoccer);
  Future<void> updateMatch(MatchSoccer match, int id);
  Future<void> deleteMatchById(int id);
}
