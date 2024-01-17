import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathway_mobile/app_router.dart';
import 'package:pathway_mobile/providers/player_global.dart';
import 'package:pathway_mobile/theme/app_theme_data.dart';

void main() {
  final container = ProviderContainer();

  /// Initialise providers
  container.read(playerGlobalProvider);

  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
}

class MyApp extends StatelessWidget {
  final AppRouter router = AppRouter();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathway Mobile',
      theme: buildAppThemeData(context),
      initialRoute: AppRoutes.home.name,
      debugShowCheckedModeBanner: false,
      routes: router.routes,
    );
  }
}
