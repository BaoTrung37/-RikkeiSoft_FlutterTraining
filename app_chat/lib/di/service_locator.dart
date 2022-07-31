import 'package:app_chat/provider/auth_provider.dart';
import 'package:app_chat/provider/home_provider.dart';
import 'package:app_chat/util/navigation_service.dart';
import 'package:get_it/get_it.dart';

import '../provider/chat_provider.dart';

class ServiceLocator {
  Future<void> setUp() async {
    GetIt.I.registerSingleton<NavigationSerivce>(NavigationSerivce());
    GetIt.I.registerLazySingleton<ChatProvider>(() => ChatProvider());
    GetIt.I.registerLazySingleton<AuthProvider>(() => AuthProvider());
    GetIt.I.registerLazySingleton<HomeProvider>(() => HomeProvider());
  }
}
