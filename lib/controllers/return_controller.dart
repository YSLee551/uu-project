import 'package:get/get.dart';

class ReturnController {
  static String _lockerID = '';
  static String _umbID = '';

  static void setLocker(String code) {
    _lockerID = code;
  }

  static void setUmb(String code) {
    _umbID = code;
  }

  static String getLocker() {
    return _lockerID;
  }

  static String getUmb() {
    return _umbID;
  }

  //TODO: DB에 한번에 올리는 메소드
}
