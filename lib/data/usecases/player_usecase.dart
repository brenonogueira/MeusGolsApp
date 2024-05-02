// import 'package:meus_gols_app/data/models/player.dart';
// import 'package:meus_gols_app/infra/cache/local_storage_adapter.dart';

// class PlayerUseCase {
//   final LocalStorageAdapter _localStorageAdapter;

//   PlayerUseCase(this._localStorageAdapter);

//   void saveMatchData(Player player) {
//     final data = player.toJson();
//     _localStorageAdapter.save(key: "player", value: data);
//   }

//   Player getMatchData() {
//     final data = _localStorageAdapter.fetch("player");
//     return Player.fromJson(data as Map<String, dynamic>);
//   }
// }
