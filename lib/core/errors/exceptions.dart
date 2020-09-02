class ServerException implements Exception{
  final String message;

  ServerException({this.message});
}

/* class ApplicationNotFoundException implements Exception{
   String message = 'The application containing that ID could not be found';

  String getMessage(){return message;} 
} */

class CacheException implements Exception{
  final String message;

  CacheException({this.message});
}
class CacheFullException
{
  final String message;

  CacheFullException({this.message});
}
class SQFliteException implements Exception{
  final String message;

  SQFliteException({this.message});
}
class  NetworkConnectionException implements Exception{
  final message;

  NetworkConnectionException({this.message});
}