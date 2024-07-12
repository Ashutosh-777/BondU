import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:magicconnect/modals/contact_model.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/database_strings.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../modals/view_model.dart';
import 'auth_user_helper.dart';

class ApiService {
  ApiService() {
    _addInterceptors();
  }
  static getHeader() {
    return {
      'Content-Type': 'application/json',
    };
  }

  static final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      headers: getHeader(),
      validateStatus: (status) => true,
    ),
  );

  void _addInterceptors() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        logPrint: (object) {
          log(object.toString());
        },
      ),
    );
  }

  //Backend Helper not needed in verify user
  Future<Map<String, dynamic>> verifyUser(String token) async {
    try {
      dynamic results =
          await dio.get('https://server.bondu.in/user/authenticate/phone',
              options: Options(
                headers: {"Authorization": token},
              ));
      BackendHelper.id = results.data['_id'];
      BackendHelper.sessionToken = results.data['sessionToken'];
      AuthUserHelper.setSessionToken(results.data['sessionToken']);
      AuthUserHelper.setUserID(results.data['_id']);
      return results;
    } catch (e) {
      return {"error": true};
    }
  }

  // Future<String> postUser(UserInfo user) async {
  //   String? tempId = await AuthUserHelper.getUserID();
  //   try {
  //     Response response = await dio.post(
  //       'https://server.bondu.in/user/updateUser/$tempId',
  //       options: Options(
  //         headers: getHeader(),
  //       ),
  //       data: {
  //         "name": user.name,
  //         "phone": user.phone,
  //         "email": user.email,
  //         "companyName": user.companyName,
  //         "designation": user.designation,
  //         "bio": user.bio,
  //       },
  //     );
  //
  //     // Check if the request was successful (status code 2xx)
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // Parse the JSON response
  //       print("helo");
  //       var responseData = response.data;
  //       String temp = responseData.toString();
  //       String id = "";
  //       int i = 5;
  //       while (temp[i] != ' ') {
  //         id += temp[i];
  //         i++;
  //       }
  //       if (id == BackendHelper.id) {
  //         print("BAckend id and id same");
  //       }
  //       BackendHelper.id = id;
  //       print(BackendHelper.id);
  //       AuthUserHelper.setUserID(id);
  //       return "success";
  //     } else {
  //       print("Failed with status: ${response.statusCode}");
  //       return "Failed";
  //     }
  //   } catch (e) {
  //     print(e);
  //     print("______________________________________________________");
  //     return "Failed";
  //   }
  // }

  Future<void> updateUser(UserInfo user) async {
    String id = BackendHelper.id;
    Map<String, dynamic> userDetailsJSON = user.toJson();
    userDetailsJSON.remove("_id");
    userDetailsJSON.remove("phone");
    try {
      await dio.post(
        'https://server.bondu.in/user/updateUser/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "Authorization": BackendHelper.sessionToken,
          },
        ),
        data: userDetailsJSON,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserInfo> getUser() async {
    String? temp = await AuthUserHelper.getUserID();
    Response response = await dio.get(
      'https://server.bondu.in/user/$temp',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    UserInfo user = UserInfo.fromJson(response.data);
    AuthUserHelper.setUserData(jsonEncode(user.toJson()));
    return user;
  }

  Future<List<ContactModel>> getContacts() async {
    Response response = await dio.get(
      'https://server.bondu.in/profile/getContacts/${BackendHelper.id}',
      options: Options(
        headers: {
          'Authorization': BackendHelper.sessionToken,
          'Content-Type': 'application/json',
        },
      ),
    );

    var data = response.data;

    List<ContactModel> contacts = [];
// TODO: RESET THIS
    // contacts.add(ContactModel(
    //     name: "TEMP",
    //     companyName: "NeoDocs",
    //     email: "abcdefghijkl@g.com",
    //     phone: 8120401100));
    data.forEach((s) {
      contacts.add(ContactModel.fromJson(s));
    });

    return contacts;
  }

  Future<void> deleteContacts(String contactMobile) async {
    await dio.post('https://server.bondu.in/profile/deleteContact',
        options: Options(
          headers: {
            'Authorization': BackendHelper.sessionToken,
            'Content-Type': 'application/json',
          },
        ),
        data: {"userID": BackendHelper.id, "contactMobile": contactMobile});
  }

  Future<ViewModel> getViews() async {
    try {
      Response response = await dio.get(
        'https://server.bondu.in/profile/getAnalytics/${BackendHelper.id}',
        options: Options(
          headers: {
            'Authorization': BackendHelper.sessionToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      var data = response.data;
      ViewModel views = ViewModel.fromJson(data);

      return views;
    } catch (e) {
      return ViewModel(
          views: null,
          contacted: null,
          tapThroughRate: null,
          lastContactDate: '');
    }
  }

  Future<String> updateSocials(UserInfo user) async {
    try {
      String? userID = await AuthUserHelper.getUserID();
      dio.post('https://server.bondu.in/user/updateUser/$userID',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              "Authorization": BackendHelper.sessionToken,
            },
          ),
          data: {"socialMediaHandles": user.socialMediaHandles});
      return "Success";
    } catch (e) {
      return "Failed";
    }
  }

  Future<bool> getContactExists(String phoneNumber) async {
    try {
      Response response = await dio.get(
        'https://server.bondu.in/user/userExists/$phoneNumber',
        options: Options(
          headers: {
            'Authorization': BackendHelper.sessionToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = response.data;
      if (data['success'] == true && data['userExists'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
