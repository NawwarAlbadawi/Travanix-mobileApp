import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/travanix_layout/presentation/views_models/cubits/change_bottom_nav_bar_cubit.dart';


import 'package:travanix/core/styles/app_colors.dart';
class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<ChangeBottomNavBarCubit,ChangeBottomNavBarState>(
      builder:(context,state){
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CrystalNavigationBar(
            currentIndex:ChangeBottomNavBarCubit.get(context).navIndex,
            // indicatorColor: Colors.white,
            selectedItemColor: basicColor,
            unselectedItemColor: Colors.white70,
            backgroundColor:navyBlueColor,
            // outlineBorderColor: basicColor,
            borderRadius: 25,
            splashColor: Colors.transparent,
            curve: Curves.decelerate,
            onTap: (index){
              ChangeBottomNavBarCubit.get(context).changeBottomNavBarIndex(index);
            },
            items: [
              /// Home
              CrystalNavigationBarItem(
                icon: FontAwesomeIcons.house,

              ),

              /// Favourite
              CrystalNavigationBarItem(
                icon:IconlyBold.heart,
                selectedColor: Colors.red,


              ),

              /// Add
              CrystalNavigationBarItem(
                icon: FontAwesomeIcons.boxArchive,

              ),

              /// Search
              CrystalNavigationBarItem(
                  icon: FontAwesomeIcons.solidUser,


                  ),


            ],
          ),
        );
      } ,

    );
  }
}
