import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/views/login_screen.dart';
import 'package:travanix/Features/authentication/views/register.dart';
import 'package:travanix/Features/on_boarding/views/on_boarding_view.dart';
import 'package:travanix/Features/splash_view/views/splash_view.dart';

abstract class AppRouter

{
   static const splashView ='/';
   static const onBoarding ='/OnBoarding';
   static const loginScreen ='/loginScreen';
   static const registerScreen ='/registerScreen';
  static final  GoRouter router =  GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        
      ),
      GoRoute(
        path: onBoarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoarding();
        },

      ),
      GoRoute(
        path:loginScreen ,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreenView();
        },

      ),

      GoRoute(
        path:registerScreen ,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },

      ),
    ],

  );

}