import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  Failure([List properties = const <dynamic>[]]);
}

//General Failures
class ServerFailure extends Failure{
  @override
  List<Object> get props => null;
}

//job application failure 
class ApplicationNotFoundFailure extends Failure{
  @override
  List<Object> get props => null;
}

class CacheFailure extends Failure{
  @override
  List<Object> get props => null;
}

class SQFliteFailure extends Failure{
  @override
  List<Object> get props => null;

}
class SearchNotFoundFailure extends Failure{
  @override
  
  List<Object> get props => null;

}
class NetworkConnectionFailure extends Failure{
  @override
  List<Object> get props => null;

}
class DataPersistenceFailure extends Failure{
  
  @override
  List<Object> get props => null;

}