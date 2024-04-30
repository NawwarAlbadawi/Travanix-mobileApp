import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/Features/splash_view/views/splash_view.dart';
import 'package:travanix/core/styles/app_styles.dart';
import 'package:travanix/core/utils/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        routerConfig:AppRouter.router ,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:appTheme
          )

        ),

      
      

    );
  }
}

