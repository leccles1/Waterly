import 'package:Waterly/app/app_constants.dart';
import 'package:Waterly/app/locator.dart';
import 'package:Waterly/models/plant_model.dart';
import 'package:Waterly/models/user_model.dart';
import 'package:Waterly/services/app_write/app_write_service.dart';
import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DatabaseService {
  final AppWriteService _appWriteService = locator<AppWriteService>();

  final String _plantCollection = AppConstants.COLLECTIONS['plants'];
  Database collections;

  DatabaseService() {
    print("Initialising DB service ");
    collections = Database(_appWriteService.client);
  }

  Future createPlant(Map<String, dynamic> values) async {
    try {
      print("Attempting to create plant");
      User user = _appWriteService.authenticatedUser;
      String userId = user.id;
      var result = await collections.createDocument(
        collectionId: _plantCollection,
        read: ['user:$userId'],
        write: ['user:$userId'],
        data: values,
      );
      return result;
    } on DioError catch (e) {
      print("ERROR FOUND");
      print(e.response);
    }
  }

  Future deletePlant(String documentId) async {
    try {
      print('Attempting to delete document');
      var response = await collections.deleteDocument(
          collectionId: _plantCollection, documentId: documentId);
      print(response);
    } on DioError catch (e) {
      print("Error deleting document: $documentId");
      print(e.response);
    }
  }

  Future<List<Plant>> getPlants() async {
    List<Plant> _plantEntries = List.empty(growable: true);
    try {
      Response plants = await collections.listDocuments(
        collectionId: _plantCollection,
      );
      List<dynamic> result = plants.data['documents'];

      result.forEach((plant) {
        _plantEntries.add(Plant.fromJson(plant));
      });
    } on DioError catch (e) {
      print("Error fetching documents");
      print(e.response);
    }
    return _plantEntries;
  }
}
