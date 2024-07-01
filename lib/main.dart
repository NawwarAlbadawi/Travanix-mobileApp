import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:travanix/Features/favorite/data/repositories/get_favorite_repo.dart';
import 'package:travanix/Features/favorite/data/repositories/post_favorite_repo.dart';
import 'package:travanix/Features/favorite/presentation/views_model/favorite_cubit.dart';
import 'package:travanix/Features/hotels/data/repositories/get_hotels_repo.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import 'package:travanix/Features/map/presentation/views_model/init_map_services_cubit.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';

import 'package:travanix/Features/travanix_layout/presentation/views_models/cubits/change_bottom_nav_bar_cubit.dart';
import 'package:travanix/bloc_observer.dart';

import 'package:travanix/core/styles/app_styles.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/cache_service.dart';
import 'package:travanix/core/utils/routers.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
WidgetsFlutterBinding.ensureInitialized();

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
          BlocProvider(create: (context)=>InitMapCubit()..initMapService()),
          BlocProvider(create: (context)=>GetAllHotelCubit(GetHotelsRepo())..getAllHotel()),
          BlocProvider(create: (context)=>ProfileCubit()..getProfileData()),
          //BlocProvider(create: (context)=>FavoriteCubit(GetFavoriteRepo(),PostFavoriteRepo())..getFavorite())
        ],
        child: SafeArea(
          child: MaterialApp.router(

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

