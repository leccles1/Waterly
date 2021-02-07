import 'package:Waterly/app/locator.dart';
import 'package:Waterly/app/router.gr.dart';
import 'package:Waterly/services/account_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AccountService _accountService = locator<AccountService>();
  // final SnackbarService _snackbarService = locator<SnackbarService>();

  Future handleStartupLogic() async {
    var hasLoggedInUser = await _accountService.isAuthenticated();
    if (hasLoggedInUser) {
      _navigationService.navigateTo(Routes.homeView,
          arguments: HomeViewArguments(user: _accountService.user));
    } else {
      _navigationService.navigateTo(Routes.loginView);
    }
  }
}
