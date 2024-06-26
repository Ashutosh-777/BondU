import 'package:dio/dio.dart';
import 'package:magicconnect/modals/contact_model.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/database_strings.dart';
import '../modals/view_model.dart';
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
  //Backend Helper not needed in verify user
  Future<Map<String, dynamic>> verifyUser(String token) async {
    print("Inside verify User__________________________________________________________________");
    try {
      dynamic results =
          await dio.get('https://server.magiconnect.in/user/authenticate/phone',
              options: Options(
                headers: {"Authorization": token},
              ));
      print(results);
      BackendHelper.id = results.data['_id'];
      BackendHelper.sessionToken = results.data['sessionToken'];
      AuthUserHelper.setSessionToken(results.data['sessionToken']);
      AuthUserHelper.setUserID(results.data['_id']);
      print("BackendHelper.id = result.data['id] is ${BackendHelper.id}");
      return results;
    } catch (e) {
      return {"error": true};
    }
  }

  // Future<String> postUser(UserInfo user) async {
  //   String? tempId = await AuthUserHelper.getUserID();
  //   try {
  //     Response response = await Dio().post(
  //       'https://server.magiconnect.in/user/updateUser/$tempId',
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
      Response response = await Dio().post(
        'https://server.magiconnect.in/user/updateUser/$id',
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
    }
  }

  Future<UserInfo> getUser() async {
    print("Inside Get Results");
    String? temp = await AuthUserHelper.getUserID();
    print(temp);
    Response response = await Dio().get(
      'https://server.magiconnect.in/user/${temp}',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    print("Here goes response ___________________");
    print(response.data);
    UserInfo user = UserInfo.fromJson(response.data);
    print(response.data['name']);
    print(user.name.runtimeType);
    AuthUserHelper.setUserData(user.toJson().toString());
    return user;
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
  Future<ViewModel> getViews() async {
    try{
      Response response = await Dio().get(
        'https://server.magiconnect.in/profile/getAnalytics/${BackendHelper.id}',
        options: Options(
          headers: {
            'Authorization': BackendHelper.sessionToken,
            'Content-Type': 'application/json',
          },
        ),
      );
      var data = response.data;
      ViewModel views = ViewModel.fromJson(data);
      if(true){
        return Future.error("error");
      }
      return views;
    }catch(e){
      print("error in here $e");
      return ViewModel(views: null, contacted: null, tapThroughRate: null, lastContactDate: '');
    }

  }
  Future<String> updateSocials(UserInfo user) async{
    try{
      String? userID = await AuthUserHelper.getUserID();
      var response = await Dio().post('https://server.magiconnect.in/user/updateUser/$userID',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              "Authorization": BackendHelper.sessionToken,
            },
          ),
          data: {
            "socialMediaHandles": user.socialMediaHandles}
      );
      return "Success";
    }catch(e){
      print(e.toString());
      return "Failed";

    }

  }
}
