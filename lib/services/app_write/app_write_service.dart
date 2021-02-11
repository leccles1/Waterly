import 'package:Waterly/app/app_constants.dart';
import 'package:Waterly/models/user_model.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppWriteService {
  final Client client = Client();
  final String _url = AppConstants.BASE_URL;
  final String _projectId = AppConstants.PROJECT_ID;
  final bool _environment = AppConstants.isDevelopment;

  User authenticatedUser;

  AppWriteService() {
    client
        .setEndpoint("$_url/v1")
        .setProject(_projectId)
        .setSelfSigned(status: _environment);
  }
}
