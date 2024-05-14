import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MatchRepositoryImpl implements MatchRepository {
   late final Database _database;

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "MYDb.db"),
      onCreate: (database, version) async {
        await database.execute("""
        CREATE TABLE matches(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fut_description TEXT NOT NULL,
        goals_amount INTEGER NOT NULL,
        match_date TEXT NOT NULL,
        )
        """);
      },
      version: 1,
    );
  }

  @override
  Future<void> addMatch(MatchSoccer matchSoccer) async {
       final Database db = await initDB();
       db.insert("matches", matchSoccer.toJson());
  }

  @override
  Future<void> deleteMatchById(int id) {
    // TODO: implement deleteMatchById
    throw UnimplementedError();
  }

  @override
  Future<List<MatchSoccer>> findAll() async {
    // Get a reference to the database.
    final db = await initDB();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('matches');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return MatchSoccer(
        fut_description: maps[i]['fut_description'],
        goals_amount: maps[i]['goals_amount'],
        match_date: maps[i]['match_date']
      );
    });
  }

  @override
  Future<void> updateMatch(MatchSoccer match, int id)  async {
     final Database db = await initDB();
    await db.update('matches', match.toJson(),
        where: 'id = ?', whereArgs: [id]);
  }
}