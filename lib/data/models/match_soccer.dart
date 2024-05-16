class MatchSoccer {
  int? id;
  String fut_description;
  int goals_amount;
  String match_date;

  MatchSoccer({
    this.id,
    required this.fut_description,
    required this.goals_amount,
    required this.match_date
  });

  factory MatchSoccer.fromJson(Map<String, dynamic> json) {
    return MatchSoccer(
      id: json['id'],
      fut_description: json['fut_description'],
      goals_amount: json['goals_amount'],
      match_date: json['match_date']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fut_description': fut_description,
      'goals_amount': goals_amount,
      'match_date': match_date
    };
  }
}