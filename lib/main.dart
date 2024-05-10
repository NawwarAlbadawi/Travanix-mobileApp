import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:travanix/Features/travanix_layout/presentation/views_models/cubits/change_bottom_nav_bar_cubit.dart';

import 'package:travanix/core/styles/app_styles.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/cache_service.dart';
import 'package:travanix/core/utils/routers.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
DioHelper.initDio();
await CacheHelper.initSharedPreferences();
  runApp( DevicePreview(
    enabled: true,
    builder: (context) =>const  MyApp(), // Wrap your app
  ));
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
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,

            routerConfig:AppRouter.router ,
            debugShowCheckedModeBanner: false,
            theme:appTheme

            ),




        ),
      ),
    );
  }
}

