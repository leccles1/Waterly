import 'package:Waterly/app/locator.dart';
import 'package:Waterly/models/session_model.dart';
import 'package:Waterly/models/user_model.dart';
import 'package:Waterly/services/app_write/app_write_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:appwrite/appwrite.dart';

@lazySingleton
class AccountService {
  final AppWriteService _appWriteService = locator<AppWriteService>();

  Account account;
  User _user;
  User get user => _user;
  Future get authenticatedUser async => account.get();
  AccountService() {
    print('Initialising the Account service');
    account = Account(_appWriteService.client);
  }

  Future<Response> createUser(
      String email, String password, String name) async {
    print("In account service");
    Response user =
        await account.create(email: email, password: password, name: name);
    return user;
  }

  Future loginWithEmailAndPassword(String email, String password) async {
    print("Authenticated User: " + _user.toString());
    try {
      if (_user == null) {
        var session = await account.createSession(
          email: email,
          password: password,
        );
        print(session.data);
        Session sesh = Session.fromJson(session.data);
        print(sesh.toString());
        Response userResponse = await account.get();
        _user = User.fromJson(userResponse.data);
        _appWriteService.authenticatedUser = _user;
        return _user;
      } else {
        return _user;
      }
    } on DioError catch (e) {
      print("Failed with status code: " + e.response.statusCode.toString());
      print(e.response.data['message']);
      return e.response.data;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      Response userResponse = await account.get();
      print(userResponse.data);
      User user = User.fromJson(userResponse.data);
      print("User email: " + user.email);
      print("User id: " + user.id);
      //If user session found and not stored in memory, add to memory.
      if (_user == null) {
        _user = user;
        _appWriteService.authenticatedUser = _user;
      }

      return user != null;
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        return false;
      }
    }

    // print(user);
    // if (user.statusCode == 401) {
    //   return false;
    // }
    // return user != null;
  }

  Future<Response> verifyEmail() async {
    print("Verifying email");
    Response test = await account.createVerification(url: 'http://10.0.2.2/');
    print(test);
    return test;
  }
}
