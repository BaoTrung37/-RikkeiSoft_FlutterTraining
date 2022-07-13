import 'package:app_chat/util/navigation_service.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  Future<void> setUp() async {
    GetIt.I.registerSingleton<NavigationSerivce>(NavigationSerivce());
  }
}
