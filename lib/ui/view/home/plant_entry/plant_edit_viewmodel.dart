import 'package:Waterly/app/locator.dart';
import 'package:Waterly/app/router.gr.dart';
import 'package:Waterly/services/app_write/database_service.dart';
import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PlantEditViewModel extends BaseViewModel {
  String _title = 'Editing';
  String get title => _title;
  final DatabaseService _databaseService = locator<DatabaseService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future createPlant({Map<String, dynamic> plantValues}) async {
    try {
      Response result =
          await runBusyFuture(_databaseService.createPlant(plantValues));
      if (result is Response) {
        _navigationService.navigateTo(Routes.homeView);
      }
    } on DioError catch (e) {
      print(e.type);
    }
  }
}
