import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/providers/api_provider.dart';
import 'package:rickandmortyapp/screens/home_screen.dart';
import 'package:rickandmortyapp/screens/character_screen.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
            path: 'character',
            builder: (context, state) {
              return const CharacterScreen();
            })
      ]),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApiProvider(),
        child: MaterialApp.router(
          title: 'Material App',
          debugShowMaterialGrid: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          routerConfig: _router,
        ));
  }
}
