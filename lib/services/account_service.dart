import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:appwrite/appwrite.dart';

@lazySingleton
class AccountService {
  final Client _client = Client();

  Account account;
  Response _user;
  Response get user => _user;

  AccountService() {
    print('Initialising the Account service');
    _client
        .setEndpoint("https://10.0.2.2/v1")
        .setProject('601fc4618433a')
        .setSelfSigned();
    account = Account(_client);
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
        Response session = await account.createSession(
          email: email,
          password: password,
        );
        _user = await account.get();
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
      Response user = await account.get();
      //If user session found and not stored in memory, add to memory.
      if (_user == null) _user = user;
      return user != null;
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        return false;
      }
    }

    print(user);
    if (user.statusCode == 401) {
      return false;
    }
    return user != null;
  }

  Future<Response> verifyEmail() async {
    print("Verifying email");
    Response test = await account.createVerification(url: 'http://10.0.2.2/');
    print(test);
    return test;
  }
}
