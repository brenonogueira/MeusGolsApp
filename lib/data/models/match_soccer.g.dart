// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_soccer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchSoccer _$MatchSoccerFromJson(Map<String, dynamic> json) => _MatchSoccer(
  id: (json['id'] as num?)?.toInt(),
  fut_description: json['fut_description'] as String,
  goals_amount: (json['goals_amount'] as num).toInt(),
  assists_amount: (json['assists_amount'] as num).toInt(),
  match_date: json['match_date'] as String,
);

Map<String, dynamic> _$MatchSoccerToJson(_MatchSoccer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fut_description': instance.fut_description,
      'goals_amount': instance.goals_amount,
      'assists_amount': instance.assists_amount,
      'match_date': instance.match_date,
    };
