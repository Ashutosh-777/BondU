import 'package:dio/dio.dart';
import 'package:magicconnect/modals/contact_model.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/database_strings.dart';
import 'auth_user_helper.dart';

class ApiService {
  static getHeader() {
    return {
      'Content-Type': 'application/json',
    };
  }

  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: getHeader(),
  ));
  Future<Map<String, dynamic>> verifyUser(String token) async {
    try {
      dynamic results =
          await dio.get('https://server.magiconnect.in/user/authenticate/phone',
              options: Options(
                headers: {"Authorization": token},
              ));
      print(results);
      BackendHelper.id = results.data['_id'];
      BackendHelper.sessionToken = results.data['sessionToken'];
      AuthUserHelper.setSessionToken(BackendHelper.sessionToken);
      AuthUserHelper.setUserID(BackendHelper.id);
      print("BackendHelper.id = result.data['id] is ${BackendHelper.id}");
      return results;
    } catch (e) {
      return {"error": true};
    }
  }

  Future<String> postUser(UserInfo user) async {
    try {
      Response response = await Dio().post(
        'https://server.magiconnect.in/user/add',
        options: Options(
          headers: getHeader(),
        ),
        data: {
          "name": user.name,
          "phone": user.phone,
          "email": user.email,
          "companyName": user.companyName,
          "designation": user.designation,
          "bio": user.bio,
        },
      );

      // Check if the request was successful (status code 2xx)
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the JSON response
        print("helo");
        var responseData = response.data;
        String temp = responseData.toString();
        String id = "";
        int i = 5;
        while (temp[i] != ' ') {
          id += temp[i];
          i++;
        }
        if (id == BackendHelper.id) {
          print("BAckend id and id same");
        }
        BackendHelper.id = id;
        print(BackendHelper.id);
        return "success";
      } else {
        print("Failed with status: ${response.statusCode}");
        return "failed";
      }
    } catch (e) {
      print(e);
      print("______________________________________________________");
      return "failed";
    }
  }

  Future<void> updateUser(UserInfo user) async {
    String id = BackendHelper.id;
    print("id: $id}");
    Map<String, dynamic> userDetailsJSON = user.toJson();
    userDetailsJSON.remove("_id");
    userDetailsJSON.remove("phone");

    try {
      Response response = await Dio().post(
        'https://server.magiconnect.in/user/updateUser/${id}',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "Authorization": BackendHelper.sessionToken,
          },
        ),
        data: userDetailsJSON,
      );
    } catch (e) {
      print(e);
      print("______________________________________________________");
    }
  }

  Future<UserInfo> getUser() async {
    Response response = await Dio().get(
      'https://server.magiconnect.in/user/${BackendHelper.id}',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    print("id: ${BackendHelper.id}");
    // print(response.data);
    // print("Hello");
    // var jsonData = jsonDecode(response.data);
    // return UserInfo.fromJson(jsonData);
    return UserInfo.fromJson(response.data);
    // if (response.data is String) {
    //   var jsonData = jsonDecode(response.data);
    //   return UserInfo.fromJson(jsonData);
    // } else if (response.data is Map<String, dynamic>) {
    //
    // } else {
    //   // Handle other cases if necessary
    //   throw Exception('Unexpected data type in response');
    // }
  }

  Future<List<ContactModel>> getContacts() async {
    Response response = await Dio().get(
      'https://server.magiconnect.in/profile/getContacts/${BackendHelper.id}',
      options: Options(
        headers: {
          'Authorization': BackendHelper.sessionToken,
          'Content-Type': 'application/json',
        },
      ),
    );

    var data = response.data;

    List<ContactModel> contacts = [];
    print(data);
    data.forEach((s) {
      contacts.add(ContactModel.fromJson(s));
    });

    return contacts;
  }
}
