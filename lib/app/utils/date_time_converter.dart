import 'package:shamsi_date/shamsi_date.dart';

String jalaliDateNow() {
  var jalali = Jalali.now();
  var nowDate = jalali.year.toString() + "/" + jalali.month.toString() + "/" + jalali.day.toString();
  return nowDate ;
}