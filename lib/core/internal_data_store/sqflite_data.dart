import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/career_search/data/models/career_posting_model.dart';
import '../../features/career_search/data/models/career_search_model.dart';
import '../../features/career_search/domain/entities/career_posting.dart';

class SQFliteData {
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

  static final _careerSearchTable = 'careerPostingsTable';
  static final _databaseVersion = 1;
  static Database _database;
  static final _databaseName = 'careersAptDatabase.db';

  SQFliteData._privateConstructor();
  static final SQFliteData instance = SQFliteData._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + _databaseName;

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    final sqlQuery = ''' CREATE TABLE $_careerSearchTable
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
  } //end method

  Future<int> insertCareerSearch(
      {@required CareerSearchModel careerSearchModel}) async {
    List<Map<String, dynamic>> maps = careerSearchModel.getlistOfMaps();
    Database db = await this.database;
    int result;
    final sql =
        '''INSERT INTO $_careerSearchTable ($city, $closeDate, $compNum, $facility, $isTerm,
      $onGoing, $postingId, $shift, $shiftDesp, $title, $department,$rQualifications,
      $dayShift, $shiftHour, $unionRate, $tSalaryFrom, $tSalaryTo, $wageRate, $openDate) 
      VALUES
      (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ''';

    for (Map<String, dynamic> map in maps) {
      var model = CareerPostingModel.fromJson(map);
      db.rawQuery(sql, [
        model.city,
        model.closeDate,
        model.compNum,
        model.facility,
        model.isTerm,
        model.onGoing,
        model.postingID,
        model.shift,
        model.shiftDesp,
        model.title,
        model.department,
        model.rQualifications,
        model.dayShift,
        model.shiftHour,
        model.unionRate,
        model.tSalaryFrom,
        model.tSalaryTo,
        model.wageRate,
        model.openDate
      ]);
    }

    return result;
  } //end method

  Future<CareerSearchModel> getLocalCareerSearch(
      String location, String title) async {
    Database db = await this.database;
    List<Map<String, dynamic>> postingsList = [];

    /* List<Map> maps  = await db.query(_careerSearchTable, orderBy: '$title ASC');  */
    final sql =
        '''SELECT * FROM $_careerSearchTable WHERE $_careerSearchTable.city = $location AND $_careerSearchTable.title = $title ''';
    List<Map> maps = await db.rawQuery(sql);
    if (maps.length > 0) {
      maps.forEach((map) {
        postingsList.add(map);
      });
      return CareerSearchModel(postingsList);
    } else
      return null;
  } //end method

  Future<int> deletePostings() async {
    Database db = await this.database;
    var result = db.delete(_careerSearchTable);
    return result;
  } //end method

  Future<CareerPosting> getCareerPosting(int postingId) async {
    Database db = await this.database;
    var result = await db.query(_careerSearchTable,
        where: "postingId = ?", whereArgs: [postingId]);
    return result.isNotEmpty ? CareerPostingModel.fromJson(result.first) : null;
  } //end method

  Future<int> insertPosting(CareerPostingModel posting) async {
    Database db = await this.database;
    var result = await db.insert(_careerSearchTable, posting.toMap());
    return result;
  } //end method

  Future<int> deleteAllPostings() async {
    Database db = await this.database;
    var result = db.delete(_careerSearchTable);
    return result;
  } //end method

  Future<int> getCareerSearchCount() async {
    var db = await this.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $_careerSearchTable'));
  } //end method

}
