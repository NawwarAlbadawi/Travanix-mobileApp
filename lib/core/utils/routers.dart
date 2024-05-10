import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views/login_screen.dart';
import 'package:travanix/Features/authentication/presentation/views/otp.dart';
import 'package:travanix/Features/authentication/presentation/views/register.dart';
import 'package:travanix/Features/authentication/presentation/views/rest_password_using_email.dart';
import 'package:travanix/Features/authentication/presentation/views/rest_password_view.dart';

import 'package:travanix/Features/home/presentation/views/home_view.dart';

import 'package:travanix/Features/on_boarding/presentation/views/on_boarding_view.dart';


import 'package:travanix/Features/splash_view/views/splash_view.dart';
import 'package:travanix/Features/travanix_layout/presentation/views/travanix_layout_view.dart';


abstract class AppRouter

{
   static const String  splashView ='/';
   static const String onBoarding ='/OnBoarding';
   static const String loginScreen ='/loginScreen';
   static const String registerScreen ='/registerScreen';
   static const String otpScreen ='/otpScreen/:email/:fromWhere';
   static const String homeScreen ='/homeScreen';
   static const String travanixLayoutView='/travanixLayoutView';
   static const String restPasswordUsingEmail ='/restPasswordUsingEmail';
   static const String restPasswordView ='/restPasswordView';


   static List<String>routerName=[
     'loginScreen',
     'registerScreen',
     'otpScreen',
     'homeScreen',
    'restPasswordScreen'
   ];

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
        name: routerName[0],
        path:loginScreen ,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreenView();
        },

      ),

      GoRoute(
        name: routerName[1],
        path:registerScreen ,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterView();
        },

      ),
      GoRoute(
        path:otpScreen ,
        name:routerName[2],

        builder: (BuildContext context, GoRouterState state) {
          return  OTPScreen(email: state.pathParameters['email'] !,fromWhere: state.pathParameters[
            'fromWhere'
          ]!,);
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
      GoRoute(
        path:restPasswordUsingEmail ,
        name: routerName[4],
        builder: (BuildContext context, GoRouterState state) {
          return  const RestPasswordUsingEmail();
        },

      ),
      GoRoute(
        path:restPasswordView ,

        builder: (BuildContext context, GoRouterState state) {
          return  const RestPasswordView();
        },

      ),

    ],

  );

}