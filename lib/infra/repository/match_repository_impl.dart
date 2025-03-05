import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MatchRepositoryImpl implements MatchRepository {

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "MYDb.db"),
      onCreate: (database, version) async {
       await database.execute('''
      CREATE TABLE IF NOT EXISTS matches (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fut_description TEXT NOT NULL,
        goals_amount INTEGER NOT NULL,
        assists_amount INTEGER NOT NULL,
        match_date TEXT NOT NULL
      )
    ''');
      },
      version: 1,
    );
  }

  @override
  Future<bool> addMatch(MatchSoccer matchSoccer) async {
    try {
      final Database db = await initDB();
      await db.insert("matches", matchSoccer.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<MatchSoccer>> findAll() async {
    final db = await initDB();
    final List<Map<String, dynamic>> matchsDb = await db.query('matches');
    
    return List.generate(matchsDb.length, (i) {
      return MatchSoccer(
          id: matchsDb[i]['id'],
          fut_description: matchsDb[i]['fut_description'],
          goals_amount: matchsDb[i]['goals_amount'],
          assists_amount: matchsDb[i]['assists_amount'],
          match_date: matchsDb[i]['match_date']);
    });
  }

  @override
  Future<void> updateMatch(MatchSoccer match, int id) async {
    final Database db = await initDB();
    await db
        .update('matches', match.toJson(), where: 'id = ?', whereArgs: [id]);
  }

   @override
     Future<int?> countGoals() async {
    final db = await initDB();
    final result = await db.rawQuery('SELECT SUM(goals_amount) FROM matches');
    int? sum = Sqflite.firstIntValue(result);
    return sum ?? 0;
  }

   @override
     Future<int?> countAssists() async {
    final db = await initDB();
    final result = await db.rawQuery('SELECT SUM(assists_amount) FROM matches');
    int? sum = Sqflite.firstIntValue(result);
    return sum ?? 0;
  }

  @override
  Future<bool> deleteMatchById(int? id) async {
     try {
       final db = await initDB();
       await db.delete('matches', where: 'id = ?', whereArgs: [id]);
      return true;
     } catch (e) {
       return false;
     }
  }
  
}
