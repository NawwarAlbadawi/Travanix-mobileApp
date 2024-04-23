import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/splash_view/views/splash_view.dart';

abstract class AppRouter

{
   static const splashView ='/';
  static final  GoRouter router =  GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        
      ),
    ],
  );

}