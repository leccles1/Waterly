import 'package:Waterly/app/locator.dart';
import 'package:Waterly/app/router.gr.dart';
import 'package:Waterly/models/plant_model.dart';
import 'package:Waterly/services/app_write/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => _title;

  List<Plant> _plantEntries = List.empty(growable: true);
  List<Plant> get plantEntries => _plantEntries;

  final NavigationService _navigationService = locator<NavigationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  void createPlant() {
    _navigationService.navigateTo(Routes.plantEditView);
  }

  Future findPlants() async {
    try {
      print("Attempting to find plants");
      _plantEntries = await runBusyFuture(_databaseService.getPlants());
      notifyListeners();
    } catch (e) {
      print("Error finding plants in viewmodel");
      print(e);
    }
  }

  Future deletePlantEntry(int index) async {
    try {
      String plantId = _plantEntries[index].id;
      await runBusyFuture(_databaseService.deletePlant(plantId));
      _plantEntries.removeAt(index);
      notifyListeners();
    } catch (e) {
      print("Error deleting");
      print(e);
    }
  }
}
