import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views/login_screen.dart';
import 'package:travanix/Features/authentication/presentation/views/otp.dart';
import 'package:travanix/Features/authentication/presentation/views/register_loading_view.dart';
import 'package:travanix/Features/authentication/presentation/views/register.dart';
import 'package:travanix/Features/authentication/presentation/views/rest_password_using_email.dart';
import 'package:travanix/Features/authentication/presentation/views/rest_password_view.dart';
import 'package:travanix/Features/home/presentation/views/home_view.dart';
import 'package:travanix/Features/hotels/presentation/views/hotels_view.dart';
import 'package:travanix/Features/hotels/presentation/views/hotel_view.dart';
import 'package:travanix/Features/map/presentation/views/map_view.dart';
import 'package:travanix/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:travanix/Features/profile/data/repositories/edit_profile_repo.dart';
import 'package:travanix/Features/profile/presentation/views/edit_profile_view.dart';
import 'package:travanix/Features/profile/presentation/views/update_email_otp_view.dart';
import 'package:travanix/Features/profile/presentation/views/wallet_view.dart';
import 'package:travanix/Features/profile/presentation/views_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/restaurant/presentation/views/restaurant_view.dart';
import 'package:travanix/Features/restaurant/presentation/views/all_restaurant_view.dart';
import 'package:travanix/Features/room/presentation/views/room_view.dart';
import 'package:travanix/Features/search/presentation/views/search_view.dart';
import 'package:travanix/Features/splash_view/views/splash_view.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';
import 'package:travanix/Features/tourist_places/presentation/views/all_tourist_places_view.dart';
import 'package:travanix/Features/tourist_places/presentation/views/tourist_places_view.dart';
import 'package:travanix/Features/travanix_layout/presentation/views/travanix_layout_view.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/booking_trip_details.dart';
import 'package:travanix/Features/trip/presentation/views/trip_info_view.dart';
import '../../Features/hotels/data/models/hotel_data_model.dart';

abstract class AppRouter

{
   static const String  splashView ='/';
   static const String onBoarding ='/OnBoarding';
   static const String loginScreen ='/loginScreen';
   static const String registerScreen ='/registerScreen';
   static const String otpScreen ='/otpScreen/:email/:fromWhere/:name/:password';
   static const String homeScreen ='/homeScreen';
   static const String travanixLayoutView='/travanixLayoutView';
   static const String restPasswordUsingEmail ='/restPasswordUsingEmail';
   static const String restPasswordView ='/restPasswordView';
   static const String registerLoading ='/registerLoading/:name/:email/:password';
   static const String mapView ='/mapView';
   static const String hotelView='/hotelView';
   static const String hotelsView='/hotelsView';
   static const String roomView='/roomView';
   static const String tripInfo='/tripInfo';
   static const String bookingHotelView='/bookingHotelView';
   static const String walletView='/walletView' ;
   static const  String restaurantView='/restaurantView';
   static const String allRestaurantView='/allRestaurantView';
   static const String tripAddNames='/tripAddNames';
   static const String searchView='/searchView';
   static const String editProfileView='/editProfileView';
   static const String updateEmailOtpView='/updateEmailOtpView';
   static const String touristPlacesView='/touristPlacesView';
   static const String allTouristPlacesView='/allTouristPlacesView';
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
            'fromWhere']!,name:state.pathParameters['name']!,
          password:state.pathParameters['password']! ,);
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
      GoRoute(
        path:registerLoading ,
        name: 'RegisterLoading',

        builder: (BuildContext context, GoRouterState state) {
          return   RegisterLoadingView(email: state.pathParameters['email']!,
          name: state.pathParameters['name']!,
          password: state.pathParameters['password']!,

          );
        },

      ),
      GoRoute(
        path: mapView,
        name: 'mapView',

        builder: (BuildContext context, GoRouterState state) {

          return  MapView(
             model: state.extra as dynamic ,
          );
        },

      ),
      GoRoute(
          path:hotelView,
        builder: (context,state)
        {
          return   HotelView(
            hotelData: state.extra as HotelData,
          );
        }
      ),
      GoRoute(
          path:hotelsView,
          builder: (context,state)
          {
            return const   HotelsView(
            );
          }
      ),
      GoRoute(
          path:roomView,
          builder: (context,state)
          {
            return const  RoomView();
          }
      ),
      GoRoute(
          path:tripInfo,
          builder: (context,state)
          {
            return   TripInfoView(model: state.extra as TripsModelData);
          }
      ),
      GoRoute(
          path:walletView,
          builder: (context,state)
          {
            return  const  WalletView();
          }
      ),
      GoRoute(
          path:restaurantView,
          builder: (context,state)
          {
            return    RestaurantView(
              model: state.extra as RestaurantData,
            );
          }
      ),
      GoRoute(
          path:allRestaurantView,
          builder: (context,state)
          {
            return  const   AllRestaurantView();
          }
      ),

      GoRoute(
          path:tripAddNames,
          builder: (context,state)
          {
            return     BookingTripDetailsView(
              model: state.extra as TripsModelData,

            );
          }
      ),
      GoRoute(
          path:searchView,
       builder: (context,state)
       {
         return  SearchView(
           searchBody: state.extra as Widget,
         );
       }),
      GoRoute(
          path:editProfileView,
          builder: (context,state)
          {
            return const EditProfileView();
          }),
      GoRoute(
          path:updateEmailOtpView,
          builder: (context,state)
          {
            return const UpdateEmailOtpView();
          }),

      GoRoute(
          path:touristPlacesView,
          builder: (context,state)
          {
            return  TouristPlacesView(model: state.extra as AttractionActivitiesModelData,);
          }),

      GoRoute(
          path:allTouristPlacesView,
          builder: (context,state)
          {
            return const AllTouristPlacesView();
          }),



    ],

  );

}