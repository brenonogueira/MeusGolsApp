class MatchSoccer {
  int amountGoals;
  DateTime date;

  MatchSoccer({
    required this.amountGoals,
    required this.date,
  });

  factory MatchSoccer.fromJson(Map<String, dynamic> json) {
    return MatchSoccer(
      amountGoals: json['amount_goals'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount_goals': amountGoals,
      'date': date.toIso8601String(),
    };
  }
}