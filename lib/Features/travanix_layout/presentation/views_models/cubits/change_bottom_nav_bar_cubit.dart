import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/authentication/presentation/views/login_screen.dart';
import 'package:travanix/Features/authentication/presentation/views/register.dart';
import 'package:travanix/Features/home/presentation/views/widgets/home_view_body.dart';

part 'change_bottom_nav_bar_state.dart';

class ChangeBottomNavBarCubit extends Cubit<ChangeBottomNavBarState> {
  ChangeBottomNavBarCubit() : super(ChangeBottomNavBarInitial());
  static ChangeBottomNavBarCubit get(context)=>BlocProvider.of(context);
  List<Widget>screens=[
   const HomeViewBody(),
   const LoginScreenView(),
   const RegisterView()
  ];
  int navIndex=0;
  void changeBottomNavBarIndex(int index)
  {
    navIndex=index;
    emit(ChangeBottomNavBarIndex());
  }
}
