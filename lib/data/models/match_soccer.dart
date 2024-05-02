class MatchSoccer {
  String player_name;
  int goals_amount;
  String match_date;

  MatchSoccer({
    required this.player_name,
    required this.goals_amount,
    required this.match_date
  });

  factory MatchSoccer.fromJson(Map<String, dynamic> json) {
    return MatchSoccer(
      player_name: json['player_name'],
      goals_amount: json['goals_amount'],
      match_date: json['match_date']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'player_name': player_name,
      'goals_amount': goals_amount,
      'match_date': match_date
    };
  }
}