import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Posting extends Equatable {
  final String city,
      closeDate,
      compNum,
      dayShift,
      department,
      facility,
      openDate,
      shift,
      shiftDesp,
      rQualifications,
      shiftHour,
      title,
      tSalaryFrom,
      tSalaryTo,
      wageRate;
  final int isTerm, onGoing, postingID, unionRate;

  Posting(
      {@required this.city,
      @required this.closeDate,
      @required this.compNum,
      @required this.dayShift,
      @required this.department,
      @required this.facility,
      @required this.openDate,
      @required this.shift,
      @required this.shiftDesp,
      @required this.rQualifications,
      @required this.shiftHour,
      @required this.title,
      @required this.tSalaryFrom,
      @required this.tSalaryTo,
      @required this.wageRate,
      @required this.isTerm,
      @required this.onGoing,
      @required this.postingID,
      @required this.unionRate});

  @override
  List<Object> get props => [
        city,
        closeDate,
        compNum,
        dayShift,
        department,
        facility,
        openDate,
        shift,
        shiftDesp,
        rQualifications,
        shiftHour,
        title,
        tSalaryFrom,
        tSalaryTo,
        wageRate,
        isTerm,
        onGoing,
        postingID,
        unionRate
      ];

  //city, closeDate, compNum, dayShift, department, facility, openDate,
  //shift, shiftDesp, rQualifications, shiftHour, title, tSalaryFrom, tSalaryTo, wageRate, isTerm, onGoing, postingID, unionRate

} //end class
