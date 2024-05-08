import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views/login_screen.dart';
import 'package:travanix/Features/authentication/presentation/views/otp.dart';
import 'package:travanix/Features/authentication/presentation/views/register.dart';

import 'package:travanix/Features/home/presentation/views/home_view.dart';

import 'package:travanix/Features/on_boarding/presentation/views/on_boarding_view.dart';


import 'package:travanix/Features/splash_view/views/splash_view.dart';
import 'package:travanix/Features/travanix_layout/presentation/views/travanix_layout_view.dart';


abstract class AppRouter

{
   static const splashView ='/';
   static const onBoarding ='/OnBoarding';
   static const loginScreen ='/loginScreen';
   static const registerScreen ='/registerScreen';
   static const otpScreen ='/otpScreen';
   static const homeScreen ='/homeScreen';
   static const travanixLayoutView='/travanixLayoutView';
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
      GoRoute(
        path:otpScreen ,
        builder: (BuildContext context, GoRouterState state) {
          return  OTPScreen(email: state.extra as String);
        },

      ),
      GoRoute(
        path:homeScreen ,
        builder: (BuildContext context, GoRouterState state) {
          return  const HomeView();
        },

      ),
      GoRoute(
        path:travanixLayoutView ,
        builder: (BuildContext context, GoRouterState state) {
          return  const TravanixLayoutView();
        },

      ),
    ],

  );

}