// import 'package:flutter/material.dart';
import 'package:flutterbasic/main.dart';
import 'package:flutterbasic/widget/listview.dart';
import 'package:flutterbasic/widget/splashscreen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, list }

GoRouter goRouter() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        name: "splashScreen",
        builder: (context, state) => SplashScreen()),
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      builder: (context, state) =>
          const MyHomePage(title: 'Flutter Demo Home Page'),
      // pageBuilder: (context, state) => const MaterialPage(
      //     fullscreenDialog: true,
      //     child: const MyHomePage(title: "Flutter Demo Home Page")),
    ),
    GoRoute(
      path: '/list',
      name: AppRoute.list.name,
      // builder: (context, state) => Listbuilder(),
      pageBuilder: (context, state) => NoTransitionPage(child: Listbuilder()),
    )
  ]);
}
