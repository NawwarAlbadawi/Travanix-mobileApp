
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/travanix_layout/data/cubits/change_bottom_nav_bar_cubit.dart';


class TravanixLayoutViewBody extends StatelessWidget {
  const TravanixLayoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeBottomNavBarCubit,ChangeBottomNavBarState>(
      builder: (context,state)
      {
        return  ChangeBottomNavBarCubit.get(context).screens[ChangeBottomNavBarCubit.get(context).navIndex];
      },

    );
  }
}