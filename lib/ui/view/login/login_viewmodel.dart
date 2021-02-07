import 'package:Waterly/app/locator.dart';
import 'package:Waterly/app/router.gr.dart';
import 'package:Waterly/services/account_service.dart';
import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AccountService _accountService = locator<AccountService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  Future createUser(String email, String, password, String name) async {
    print("Creating User");
    Response user = await _accountService.createUser(email, password, name);
    return user;
  }

  Future getIsAuthenticated() async {
    _isAuthenticated = await _accountService.isAuthenticated();
    notifyListeners();
    if (_isAuthenticated) {
      _navigationService.navigateTo(Routes.homeView);
    }
  }

  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      var result =
          await _accountService.loginWithEmailAndPassword(email, password);

      if (result is Response) {
        print(result);
        _navigationService.navigateTo(Routes.homeView,
            arguments: HomeViewArguments(user: result));
      } else {
        _snackbarService.showSnackbar(message: result['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  void beginRegistration() {
    _navigationService.navigateTo(Routes.createAccountView);
  }
}
