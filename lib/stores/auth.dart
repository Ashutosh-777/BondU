import 'package:flutter/foundation.dart';
import '../modals/user_model.dart';

class Auth with ChangeNotifier {
  static  UserInfo _user = UserInfo();
  UserInfo get userDetails => _user;
  // void setUserId(String value) {
  //   user.id = value;
  //   notifyListeners();
  // }
  void addPhone(int val) {
    _user.phone = val;
    notifyListeners();
  }

  void addDetails(UserInfo temp) {
    print("adding details__________");
    String? id = _user.id;
    _user = temp;
    _user.id = id;
    notifyListeners();
  }
}
