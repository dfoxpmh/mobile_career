import 'package:meta/meta.dart';
import '../../domain/entities/posting.dart';

class PostingModel extends Posting {
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

  PostingModel(
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
      @required this.unionRate})
      : super(
            city: city,
            closeDate: closeDate,
            compNum: compNum,
            dayShift: dayShift,
            department: department,
            facility: facility,
            openDate: openDate,
            shift: shift,
            shiftDesp: shiftDesp,
            rQualifications: rQualifications,
            shiftHour: shiftHour,
            title: title,
            tSalaryFrom: tSalaryFrom,
            tSalaryTo: tSalaryTo,
            wageRate: wageRate,
            isTerm: isTerm,
            onGoing: onGoing,
            postingID: postingID,
            unionRate: unionRate);

  factory PostingModel.fromJson(Map<String, dynamic> json) {
    return PostingModel(
        city: json['city'],
        closeDate: json['closeDate'],
        compNum: json['compNum'],
        dayShift: json['dayShift'],
        department: json['department'],
        facility: json['facility'],
        openDate: json['openDate'],
        shift: json['shift'],
        shiftDesp: json['shiftDesp'],
        rQualifications: json['rQualifications'],
        shiftHour: json['shiftHour'],
        title: json['title'],
        tSalaryFrom: json['tSalaryFrom'],
        tSalaryTo: json['tSalaryTo'],
        wageRate: json['wageRate'],
        isTerm: json['isTerm'],
        onGoing: json['onGoing'],
        postingID: json['postingID'],
        unionRate: json['unionRate']);
  } //end factory

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'closeDate': closeDate,
      'compNum': compNum,
      'dayShift': dayShift,
      'department': department,
      'facility': facility,
      'openDate': openDate,
      'shift': shift,
      'shiftDesp': shiftDesp,
      'rQualifications': rQualifications,
      'shiftHour': shiftHour,
      'title': title,
      'tSalaryFrom': tSalaryFrom,
      'tSalaryTo': tSalaryTo,
      'wageRate': wageRate,
      'isTerm': isTerm,
      'onGoing': onGoing,
      'postingID': postingID,
      'unionRate': unionRate
    };
  } //end method
}
