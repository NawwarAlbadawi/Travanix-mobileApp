
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/authentication/presentation/views/login_screen.dart';
import 'package:travanix/Features/authentication/presentation/views/register.dart';
import 'package:travanix/Features/home/presentation/views/home_view.dart';
import 'package:travanix/Features/profile/presentation/views/profile_view.dart';
part 'change_bottom_nav_bar_state.dart';

class ChangeBottomNavBarCubit extends Cubit<ChangeBottomNavBarState> {
  ChangeBottomNavBarCubit() : super(ChangeBottomNavBarInitial());
  static ChangeBottomNavBarCubit get(context)=>BlocProvider.of(context);
  List<Widget>screens=[
   const HomeView(),
   const LoginScreenView(),
   const RegisterView(),
    const ProfileView()
  ];
  int navIndex=0;
  void changeBottomNavBarIndex(int index)
  {
    navIndex=index;
    emit(ChangeBottomNavBarIndex());
  }
}
