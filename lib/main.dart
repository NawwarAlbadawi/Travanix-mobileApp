import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:travanix/Features/hotels/data/repositories/get_hotels_repo.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import 'package:travanix/Features/map/presentation/views_model/init_map_services_cubit.dart';
import 'package:travanix/Features/profile/data/repositories/edit_profile_repo.dart';
import 'package:travanix/Features/profile/presentation/views_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';
import 'package:travanix/Features/restaurant/data/repositories/get_all_restaurants_repo.dart';
import 'package:travanix/Features/restaurant/presentation/views_model/cubits/restaurant_cubit.dart';
import 'package:travanix/Features/search/data/Repositories/search_repo.dart';
import 'package:travanix/Features/search/presentation/views_models/search_cubit/search_cubit.dart';
import 'package:travanix/Features/travanix_layout/presentation/views_models/cubits/change_bottom_nav_bar_cubit.dart';
import 'package:travanix/Features/trip/data/repositories/book_trip_repo.dart';
import 'package:travanix/Features/trip/data/repositories/get_trip_repo.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/book_trip_cubit/book_trip_cubit.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/get_trips_cubit/get_trips_cubit.dart';
import 'package:travanix/bloc_observer.dart';
import 'package:travanix/core/styles/app_styles.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/cache_service.dart';
import 'package:travanix/core/utils/routers.dart';

import 'Features/search/data/Repositories/search_for_hotel_repo.dart';
import 'Features/search/presentation/views_models/search_for_hotel_cubit/search_for_hotel_cubit.dart';

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
          BlocProvider(create: (context)=>RestaurantCubit(GetAllRestaurantsRepo())..getAllRestaurant()),
          BlocProvider(create: (context)=>GetTripsCubit(GetTripRepo())..getTrips()),
          BlocProvider(create: (context)=>BookTripCubit(BookTripRepo())),
          BlocProvider(create: (context)=>SearchCubit(SearchRepo())),
          BlocProvider(create: (context)=>SearchForHotelCubit(SearchForHotelRepo())),
          BlocProvider(create: (context)=>EditProfileCubit(EditProfileRepo()))

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

