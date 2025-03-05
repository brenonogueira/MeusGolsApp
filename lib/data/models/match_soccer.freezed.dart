// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_soccer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchSoccer {

 int? get id; String get fut_description; int get goals_amount; int get assists_amount; String get match_date;
/// Create a copy of MatchSoccer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchSoccerCopyWith<MatchSoccer> get copyWith => _$MatchSoccerCopyWithImpl<MatchSoccer>(this as MatchSoccer, _$identity);

  /// Serializes this MatchSoccer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchSoccer&&(identical(other.id, id) || other.id == id)&&(identical(other.fut_description, fut_description) || other.fut_description == fut_description)&&(identical(other.goals_amount, goals_amount) || other.goals_amount == goals_amount)&&(identical(other.assists_amount, assists_amount) || other.assists_amount == assists_amount)&&(identical(other.match_date, match_date) || other.match_date == match_date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fut_description,goals_amount,assists_amount,match_date);

@override
String toString() {
  return 'MatchSoccer(id: $id, fut_description: $fut_description, goals_amount: $goals_amount, assists_amount: $assists_amount, match_date: $match_date)';
}


}

/// @nodoc
abstract mixin class $MatchSoccerCopyWith<$Res>  {
  factory $MatchSoccerCopyWith(MatchSoccer value, $Res Function(MatchSoccer) _then) = _$MatchSoccerCopyWithImpl;
@useResult
$Res call({
 int? id, String fut_description, int goals_amount, int assists_amount, String match_date
});




}
/// @nodoc
class _$MatchSoccerCopyWithImpl<$Res>
    implements $MatchSoccerCopyWith<$Res> {
  _$MatchSoccerCopyWithImpl(this._self, this._then);

  final MatchSoccer _self;
  final $Res Function(MatchSoccer) _then;

/// Create a copy of MatchSoccer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fut_description = null,Object? goals_amount = null,Object? assists_amount = null,Object? match_date = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fut_description: null == fut_description ? _self.fut_description : fut_description // ignore: cast_nullable_to_non_nullable
as String,goals_amount: null == goals_amount ? _self.goals_amount : goals_amount // ignore: cast_nullable_to_non_nullable
as int,assists_amount: null == assists_amount ? _self.assists_amount : assists_amount // ignore: cast_nullable_to_non_nullable
as int,match_date: null == match_date ? _self.match_date : match_date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MatchSoccer implements MatchSoccer {
  const _MatchSoccer({this.id, required this.fut_description, required this.goals_amount, required this.assists_amount, required this.match_date});
  factory _MatchSoccer.fromJson(Map<String, dynamic> json) => _$MatchSoccerFromJson(json);

@override final  int? id;
@override final  String fut_description;
@override final  int goals_amount;
@override final  int assists_amount;
@override final  String match_date;

/// Create a copy of MatchSoccer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchSoccerCopyWith<_MatchSoccer> get copyWith => __$MatchSoccerCopyWithImpl<_MatchSoccer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchSoccerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchSoccer&&(identical(other.id, id) || other.id == id)&&(identical(other.fut_description, fut_description) || other.fut_description == fut_description)&&(identical(other.goals_amount, goals_amount) || other.goals_amount == goals_amount)&&(identical(other.assists_amount, assists_amount) || other.assists_amount == assists_amount)&&(identical(other.match_date, match_date) || other.match_date == match_date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fut_description,goals_amount,assists_amount,match_date);

@override
String toString() {
  return 'MatchSoccer(id: $id, fut_description: $fut_description, goals_amount: $goals_amount, assists_amount: $assists_amount, match_date: $match_date)';
}


}

/// @nodoc
abstract mixin class _$MatchSoccerCopyWith<$Res> implements $MatchSoccerCopyWith<$Res> {
  factory _$MatchSoccerCopyWith(_MatchSoccer value, $Res Function(_MatchSoccer) _then) = __$MatchSoccerCopyWithImpl;
@override @useResult
$Res call({
 int? id, String fut_description, int goals_amount, int assists_amount, String match_date
});




}
/// @nodoc
class __$MatchSoccerCopyWithImpl<$Res>
    implements _$MatchSoccerCopyWith<$Res> {
  __$MatchSoccerCopyWithImpl(this._self, this._then);

  final _MatchSoccer _self;
  final $Res Function(_MatchSoccer) _then;

/// Create a copy of MatchSoccer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fut_description = null,Object? goals_amount = null,Object? assists_amount = null,Object? match_date = null,}) {
  return _then(_MatchSoccer(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fut_description: null == fut_description ? _self.fut_description : fut_description // ignore: cast_nullable_to_non_nullable
as String,goals_amount: null == goals_amount ? _self.goals_amount : goals_amount // ignore: cast_nullable_to_non_nullable
as int,assists_amount: null == assists_amount ? _self.assists_amount : assists_amount // ignore: cast_nullable_to_non_nullable
as int,match_date: null == match_date ? _self.match_date : match_date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
