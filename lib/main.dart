import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_pictures_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: ((context, state) => const HomePage()))
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Progress Pictures App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(2, 132, 199, 100)),
      ).copyWith(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
      routerConfig: _router,
    );
  }
}
