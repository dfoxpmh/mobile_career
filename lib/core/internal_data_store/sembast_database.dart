import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase{

  //Singleton pattern
  static final SembastDatabase _singleton = SembastDatabase._();

  //Singleton accessor
  static SembastDatabase get  instance => _singleton;

  ///Completer is used for transforming syncronous code into asyncronous code
  Completer<Database> _dbOpenCompleter;

  ///private constructor
  SembastDatabase._();

  //Database object accessor
  Future<Database> get database async{

    //if  completer is null, SembastDatabase class is newly instantiated, so database is not yet opened
    if(_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      //calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }

    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter.future;
  }//end method

  Future _openDatabase() async {
    //Get a platform-specific directory where persisten app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();
    //Path with the form: /platform/specific/directory/jobApplicationDB.db
    final dbPath = join(appDocumentDir.path,'jobApplicationDB.db');

    final dbJobApplication = await databaseFactoryIo.openDatabase(dbPath);
    //Any code awaiting the Complete's future will now start executing
    _dbOpenCompleter.complete(dbJobApplication);
  }//end method

}//end class