import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:toastification/toastification.dart';
import 'package:travanix/Features/splash_view/views/splash_view.dart';
import 'package:travanix/Features/travanix_layout/data/cubits/change_bottom_nav_bar_cubit.dart';
import 'package:travanix/core/styles/app_styles.dart';
import 'package:travanix/core/utils/cache_service.dart';
import 'package:travanix/core/utils/routers.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();


await CacheHelper.initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create:(context)=> ChangeBottomNavBarCubit()),
        ],
        child: SafeArea(
          child: MaterialApp.router(

            routerConfig:AppRouter.router ,
            debugShowCheckedModeBanner: false,
            theme:appTheme

            ),




        ),
      ),
    );
  }
}

