import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travanix/Features/home/presentation/views/widgets/category_list.dart';
import 'package:travanix/Features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:travanix/Features/home/presentation/views/widgets/trip_list.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_item_box_location.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0,
        left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // const SizedBox(height: 90,),
            Text('Explore and Find ',
           style: AppTextStyles.styleMedium24(context),),
            const SizedBox(height: 5,),
            Text('Your Best Journey ',
              style: AppTextStyles.styleSemiBold24(context),),
            const SizedBox(height: 20,),
            const CustomSearchBar(),
            const SizedBox(height: 30,),
            const CustomItemBoxLocation(),
            const SizedBox(height: 20,),
            Text('Category',style: AppTextStyles.styleBold18(context),),
            const SizedBox(height: 10,),
            const CategoryList(),
            const SizedBox(height: 20,),
            Text('Most famous trip',style: AppTextStyles.styleSemiBold20(context),),
            const SizedBox(height: 20,),
            const TripList(),
            const SizedBox(height: 20,),
        ],
        ),
      ),
    );
  }
}













