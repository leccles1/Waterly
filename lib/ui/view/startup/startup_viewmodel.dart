import 'package:Waterly/app/locator.dart';
import 'package:Waterly/app/router.gr.dart';
import 'package:Waterly/services/app_write/account_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AccountService _accountService = locator<AccountService>();
  // final SnackbarService _snackbarService = locator<SnackbarService>();

  Future handleStartupLogic() async {
    var isLoggedIn = await _accountService.isAuthenticated();
    if (isLoggedIn) {
      _navigationService.clearStackAndShow(Routes.homeView);
    } else {
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}
