import 'package:app_chat/provider/fireauth_provider.dart';
import 'package:app_chat/provider/firestore_provider.dart';
import 'package:app_chat/util/navigation_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  Future<void> setUp() async {
    GetIt.I.registerSingleton<NavigationSerivce>(NavigationSerivce());
  }

  Future<void> getFireStore() async {
    GetIt.I.registerLazySingleton<FireStoreProvider>(
        () => FireStoreProvider(fireStore: FirebaseFirestore.instance));
  }

  Future<void> getFireAuth() async {
    GetIt.I.registerSingleton<FireauthProvider>(FireauthProvider());
  }
}
