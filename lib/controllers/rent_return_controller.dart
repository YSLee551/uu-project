import 'package:get/get.dart';
import 'package:uu_project/controllers/database.dart';

class RentReturnController {
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

  static void returnUmb() {
    DataBase.addUmbToLocker(umbId: _umbID, lockerId: _lockerID);
  }

  static void rentUmb() {
    DataBase.removeUmbFromLocker(umbId: _umbID, lockerId: _lockerID);
  }

  static void getUmbrellaInfo() {
    DataBase.getUmbInfo(umbId: _umbID);
  }

  //TODO: DB에 한번에 올리는 메소드
}
