import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_soccer.freezed.dart';
part 'match_soccer.g.dart';

@freezed
abstract class MatchSoccer with _$MatchSoccer {
  const factory MatchSoccer({
    int? id,
    required String fut_description,
    required int goals_amount,
    required int assists_amount,
    required String match_date,
  }) = _MatchSoccer;

  factory MatchSoccer.fromJson(Map<String, dynamic> json) => _$MatchSoccerFromJson(json);

}