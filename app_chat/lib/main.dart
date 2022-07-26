import 'package:app_chat/resources/app_colors.dart';
import 'package:app_chat/util/app_router.dart';
import 'package:app_chat/util/navigation_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'di/service_locator.dart';
import 'firebase_options.dart';
import 'util/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().setUp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Chat With Firebase',
      theme: ThemeData(
        backgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.primaryColor,
      ),
      navigatorKey: GetIt.I.get<NavigationSerivce>().navigatorKey,

      initialRoute: Routes.initial,
      // initialRoute: Routes.chatRoomScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
