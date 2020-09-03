import 'dart:async';
import 'dart:core';
import 'dart:io' as io;
//import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:collection/collection.dart';

class SqlFliteHelper {
  static const SEARCH_TABLE = "searches";
  static const DB_NAME = "searchesDB.db";

  static Database _db;
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



  Future<void> _createTable(Database db, int version) async {
    final sqlQuery = ''' CREATE TABLE $SEARCH_TABLE
      (
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
      )''';
    await db.execute(sqlQuery);
  }//end method

  Future<Database> get db async {
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async{

    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _createTable);
    return db;

  }
  

  //Future
  /* Future<String> getDatabasePath(String dbName)async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if( await Directory(dirname(path)).exists() ){
      //await deleteDatabase(path);
    }else{
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;

  }//end method  */

 /*  Future<void> initDatabase()async{
    final path = await getDatabasePath('searchesDB');
    db = await openDatabase(path,version: 1, onCreate: onCreate);
    print(db);
  }//end method

  Future<void> onCreate(Database db, int version) async{
    await _createTable(db);
  } */
}