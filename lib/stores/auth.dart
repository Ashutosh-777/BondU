import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/user_model.dart';
class Auth with ChangeNotifier, DiagnosticableTreeMixin {
  UserInfo user = UserInfo(
  );
  void setUserId(String value){
    user.id = value;
    notifyListeners();
  }
  void addPhone(int val){
    user.phone = val;
  }
  void addDetails(UserInfo temp){
    String? _id = user.id;
    user = temp;
    print(user.name);
    user.id = _id;
  }
  /// Makes `Counter` readable inside the devtools by listing all of its properties
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('count', count));
  // }
}

