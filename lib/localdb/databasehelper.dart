import 'dart:io';
import 'package:evidya/model/GroupListModal.dart';
import 'package:evidya/model/recentchatconnectionslist_modal.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseHelper {
  static const _databaseName = "chat.db";
  static const _databaseVersion = 1;

  static const table = 'Chat';
  static const grouptable = 'groupChat';
  static const recentlist = 'recentlist';
  static const recentgrouplist = 'recentgrouplist';
  static const calllist = 'calllist';

  static const Id = 'id';
  static const message = 'message';
  static const reply = 'reply';
  static const timestamp = 'timestamp';
  static const diraction = 'diraction';
  static const from = 'from1';
  static const to = 'to1';
  static const type = 'type1';
  static const badge = 'badge';
  static const profile_image = 'profile_image';
  static const email = 'email';
  static const phone = 'phone';
  static const groupname = 'groupname';

  ///CallList
  static const calleeName = 'calleeName';
  static const Calldrm = 'Calldrm';
  static const calltype = 'calltype';

  ///Recent list
  static const userid = 'userid';
  static const name = 'NAME';
  static const peerid = 'peerid';
  static const status = 'STATUS';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();

    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $message TEXT NOT NULL,
            $timestamp INTEGER NOT NULL,
            $diraction TEXT NOT NULL,
            $from TEXT NOT NULL,
            $to TEXT NOT NULL,
            $reply TEXT NOT NULL,
            $type TEXT NOT NULL
          );
          ''');
    await db.execute('''
          CREATE TABLE $grouptable (
            $Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $message TEXT NOT NULL,
            $timestamp INTEGER NOT NULL,
            $diraction TEXT NOT NULL,
            $from TEXT NOT NULL,
            $to TEXT NOT NULL,
            $reply TEXT NOT NULL,
            $type TEXT NOT NULL,
            $groupname TEXT NOT NULL
          );
          ''');
    await db.execute('''
   create table $recentlist(
    $Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $userid TEXT NOT NULL,
    $name TEXT NOT NULL,
    $peerid TEXT NOT NULL,
    $status TEXT NOT NULL,
    $profile_image TEXT NOT NULL,
    $email TEXT NOT NULL,
    $phone TEXT NOT NULL,
    $timestamp DATETIME DEFAULT 0,
    $badge VARCHAR(10) DEFAULT '0'
   );''');

    await db.execute('''
   create table $recentgrouplist(
    $Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $userid TEXT NOT NULL,
    $name TEXT NOT NULL,
    $peerid TEXT NOT NULL,
    $status TEXT NOT NULL,
    $timestamp DATETIME DEFAULT 0,
    $badge VARCHAR(10) DEFAULT '0'
   );''');

    await db.execute('''
   create table $calllist(
    $Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $calleeName TEXT NOT NULL,
    $calltype TEXT NOT NULL,
    $Calldrm TEXT NOT NULL,
    $timestamp INTEGER DEFAULT 0
   );''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<int> groupinsert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(grouptable, row);
  }

  Future<int> callinsert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(calllist, row);
  }

  Future<int> recentchatlist(row) async {

    Database db = await instance.database;
    return await db.insert(recentlist, row);
  }

  Future<int> getcount(userpeerid) async {
    var dbclient = await instance.database;
    int count = Sqflite.firstIntValue(await dbclient.rawQuery("SELECT COUNT(*) AS peer_id FROM $recentlist WHERE $peerid = $userpeerid"));
    return count;
  }


  Future<int> updatedfcm(userpeerid,fcmtoken,) async {
    var dbclient = await instance.database;
    int count = Sqflite.firstIntValue(await dbclient.rawQuery("SELECT COUNT(*) AS fcm_token FROM $recentlist WHERE $status = '$fcmtoken' AND $peerid = $userpeerid" ));
    return count;
  }

  Future<int> updatefcm(userpeerid,userfcmtoken) async {
    final db = await instance.database;
    await db.rawQuery('UPDATE $recentlist  SET   $status = "$userfcmtoken"   WHERE peerid = $userpeerid');
  }

  Future<int> update(pid ,datetime) async {
    final db = await instance.database;
    await db.rawQuery('UPDATE $recentlist  SET  $badge= CAST(CAST($badge AS int)+1 AS varchar), $timestamp = "$datetime"   WHERE peerid = $pid');
  }

  Future<int> sendUpdate(pid ,datetime) async {
    final db = await instance.database;
    await db.rawQuery('UPDATE $recentlist  SET  $badge= CAST(CAST($badge AS int)+0 AS varchar), $timestamp = "$datetime"   WHERE peerid = $pid');
  }

  Future<int> deletebadge(pid) async {
    final db = await instance.database;
    final res = await db.rawQuery("UPDATE $recentlist  SET  $badge='0' WHERE peerid = $pid");
  }

  /// recent group list
  Future<List<Groups>> getAllgroupdata() async {
    final db = await instance.database;
    List<Map> list= await db.rawQuery("SELECT * FROM $recentgrouplist ORDER BY timestamp DESC");
    List<Groups> users = [];
    for(int i=0; i < list.length; i++) {
      //users.add(Groups(id: list[i]['userid'], badge: list[i]["badge"], peerId:list[i]["peerid"], groupName:list[i]["NAME"],groupAdmin:list[i]["STATUS"],timeStamp:list[i]["timestamp"]));
    }
    print(users.toString());
    return users;
  }

  Future<int> recentchatgrouplist(row) async {

    Database db = await instance.database;
    return await db.insert(recentlist, row);
  }

  Future<int> getgroupcount(userpeerid) async {
    var dbclient = await instance.database;
    int count = Sqflite.firstIntValue(await dbclient.rawQuery("SELECT COUNT(*) AS peer_id FROM $recentlist WHERE $peerid = $userpeerid"));
    return count;
  }


  Future<int> updatedgroupfcm(userpeerid,fcmtoken,) async {
    var dbclient = await instance.database;
    int count = Sqflite.firstIntValue(await dbclient.rawQuery("SELECT COUNT(*) AS fcm_token FROM $recentlist WHERE $status = '$fcmtoken' AND $peerid = $userpeerid" ));
    return count;
  }

  Future<int> updategroupfcm(userpeerid,userfcmtoken) async {
    final db = await instance.database;
    await db.rawQuery('UPDATE $recentlist  SET   $status = "$userfcmtoken"   WHERE peerid = $userpeerid');
  }

  Future<int> updaterecentgroup(pid ,datetime) async {
    final db = await instance.database;
    await db.rawQuery('UPDATE $recentlist  SET  $badge= CAST(CAST($badge AS int)+1 AS varchar), $timestamp = "$datetime"   WHERE peerid = $pid');
  }

  Future<int> sendUpdategrouplist(pid ,datetime) async {
    final db = await instance.database;
    await db.rawQuery('UPDATE $recentlist  SET  $badge= CAST(CAST($badge AS int)+0 AS varchar), $timestamp = "$datetime"   WHERE peerid = $pid');
  }

  Future<int> deletegroupbadge(pid) async {
    final db = await instance.database;
    final res = await db.rawQuery("UPDATE $recentlist  SET  $badge='0' WHERE peerid = $pid");
  }

  Future<int> deleteAllEmployees() async {
    final db = await database;
    await db.execute("DROP TABLE IF EXISTS recentlist");
    //final res = await db.rawQuery('TRUNCATE TABLE recentlist');

  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
  Future<List<Map<String, dynamic>>> AllRows() async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $calllist ORDER BY timestamp DESC");
  }
  Future<List<Map<String, dynamic>>> Alldata() async {
    Database db = await instance.database;
    return await db.rawQuery("SELECT * FROM $grouptable ORDER BY timestamp DESC");
  }

  Future<List<Connections>> getAlldata() async {
    final db = await instance.database;
    List<Map> list= await db.rawQuery("SELECT * FROM $recentlist ORDER BY timestamp DESC");
    List<Connections> users = [];
    for(int i=0; i < list.length; i++) {
      users.add(Connections(id: list[i]['userid'], badge: list[i]["badge"], peerId:list[i]["peerid"], name:list[i]["NAME"],fcm_token:list[i]["STATUS"],timeStamp:list[i]["timestamp"],email:list[i]["email"],phone:list[i]["phone"],profile_image:list[i]["profile_image"]));
    }
    print(users.toString());
    return users;
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<List<Map<String, dynamic>>> queryRowCount(
      String peerid, String userpeerid) async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $table WHERE ($to = $peerid AND $from = $userpeerid) OR ($to = $userpeerid AND $from = $peerid)');
  }


  Future<List<Map<String, dynamic>>> groupqueryRowCount(String peerid, String userpeerid,groupnam) async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $grouptable WHERE $groupname = "$groupnam"');
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$Id = ?', whereArgs: [id]);
  }

  Future<dynamic> deletemsg(int msgid) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$Id = ?', whereArgs: [msgid]);
  }
  Future<List<Map<String, dynamic>>> clearchat(String peerid, String userpeerid) async {
    Database db = await instance.database;
    return await db.rawQuery('DELETE FROM $table WHERE ($to = $peerid AND $from = $userpeerid) OR ($to = $userpeerid AND $from = $peerid)');
  }
  Future<List<Map<String, dynamic>>> cleargroupchat(String selectedgroupname,) async {
    Database db = await instance.database;
    return await db.rawQuery('DELETE FROM $grouptable WHERE ($groupname = "$selectedgroupname")');
  }

  Future<List<Map<String, dynamic>>> deletechatlist() async {
    Database db = await instance.database;
    return await db.rawQuery('DELETE FROM $recentlist WHERE 1');
  }
}
