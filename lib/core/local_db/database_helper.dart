import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path_provider/path_provider.dart';

///
///Refer to the singleton instantiated only once in another class
///E.G.
///   final dbHelper = DatabaseHelper.instance;
///   dbHelper.methodCall();
/// TUT
/// https://medium.com/@suragch/simple-sqflite-database-example-in-flutter-e56a5aaa3f91

class DatabaseHelper {
  static const city = "city";
  static const closeDate = 'CloseDate';
  static const compNum = 'Comp_Num';
  static const facility = 'facility';
  static const isTerm = "IsTerm";
  static const onGoing = 'Ongoing';
  static const postingId = 'PostingID';
  static const shift = 'shift';
  static const shiftDesp = 'Shift_Desp';
  static const title = 'Title';
  static const department = 'department';
  static const rQualifications = 'Rqualifications';
  static const dayShift = 'Day_Shift';
  static const shiftHour = 'shifthour';
  static const unionRate = 'unionRate';
  static const tSalaryFrom = 'T_Salary_From';
  static const tSalaryTo = 'T_Salary_To';
  static const wageRate = 'wageRate';
  static const openDate = 'OpenDate';
  static final _databaseName = "postingsDB.db";
  static final _dbVersion = 1;

  static final table = 'tbl_postings';

  //Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  } //end method

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  } //end method

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table
      $city TEXT,
        $closeDate TEXT,
        $compNum TEXT,
        $facility TEXT,
        $isTerm INTEGER,
        $onGoing INTEGER,
        $postingId INTEGER,
        $shift TEXT,
        $shiftDesp TEXT,
        $title TEXT,
        $department TEXT,
        $rQualifications TEXT,
        $dayShift TEXT,
        $shiftHour TEXT,
        $unionRate INTEGER,
        $tSalaryFrom TEXT,
        $tSalaryTo TEXT,
        $wageRate TEXT,
        $openDate TEXT
    ''');
  } //end _onCreate

  Future<int> insertPosting(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // DB rows are returned as list of maps
  Future<List<Map<String, dynamic>>> returnAllPostings() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  //count all rows - this uses a raw query for e.g.
  //in case that e.g. is needed later
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> clearTable() async {
    Database db = await instance.database;
    return await db.delete(table);
  }

  //insert all the postings froma list
  //genrated by a call to RESTFUL DB
  Future<int> populateDB(List htmlPostingsList) async {
    //first empty the existing table to add new REST data
    int rowsCleared = await clearTable();

    Map<String, dynamic> tmp;

    for (var map in htmlPostingsList) {
      tmp = map;
      int tmpInt = await insertPosting(tmp);
    }
  }
}
