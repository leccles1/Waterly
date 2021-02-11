import 'package:Waterly/ui/view/home/plant_entry/plant_edit_view.dart';
import 'package:Waterly/ui/view/login/create_account/create_account_view.dart';
import 'package:Waterly/ui/view/login/login_view.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:Waterly/ui/view/home/home_view.dart';
import 'package:Waterly/ui/view/startup/startup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: CreateAccountView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: PlantEditView)
  ],
)
class $Router {}
