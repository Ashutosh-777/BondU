import 'package:flutter/foundation.dart';
import '../modals/user_model.dart';

class Auth with ChangeNotifier, DiagnosticableTreeMixin {
  static UserInfo user = UserInfo();
  UserInfo get userDetails =>user;
  // void setUserId(String value) {
  //   user.id = value;
  //   notifyListeners();
  // }
  void addPhone(int val) {
    user.phone = val;
    notifyListeners();
  }
  void addDetails(UserInfo temp) {
    String? _id = user.id;
    user = temp;
    user.id = _id;
    print("details notifed??");
    notifyListeners();
  }
}
