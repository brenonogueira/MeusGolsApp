import 'package:meus_gols_app/data/models/match_soccer.dart';

class Player {
  String id;
  String name;
  List<MatchSoccer> matchSoccers;

  Player({
    required this.id,
    required this.name,
    required this.matchSoccers,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    var matchSoccersList = json['MatchSoccers'] as List;
    List<MatchSoccer> matchSoccers =
        matchSoccersList.map((matchSoccerJson) => MatchSoccer.fromJson(matchSoccerJson)).toList();

    return Player(
      id: json['id'],
      name: json['name'],
      matchSoccers: matchSoccers,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> matchSoccersJson =
        matchSoccers.map((matchSoccer) => matchSoccer.toJson()).toList();

    return {
      'id': id,
      'name': name,
      'MatchSoccers': matchSoccersJson,
    };
  }
}