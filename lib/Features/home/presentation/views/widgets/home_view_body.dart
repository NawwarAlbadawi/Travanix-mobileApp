
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/Features/home/presentation/views/widgets/category_list.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_list.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_item_box_location.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0,
        left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Explore and Find ',
                               style: AppTextStyles.styleMedium24(context).copyWith(
                     color: basicColor,
                     fontSize: 26
                               ),),
                    const SizedBox(height: 5,),
                    Text('Your Best Journey ',
                      style: AppTextStyles.styleSemiBold24(context).copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 28
                      ),),

                  ],
                ),
                const Spacer(),
                Container(
                  height:50 ,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: basicColor,
                      boxShadow: const  [
                        BoxShadow(
                            blurRadius: 5,
                            color: greyColor
                        )
                      ]
                  ),
                  child: const Icon(FontAwesomeIcons.magnifyingGlass,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const SizedBox(height: 30,),
            const CustomItemBoxLocation(aspectRatio: 2.2,),
            const SizedBox(height: 20,),
            Text('Category',style: AppTextStyles.styleSemiBold24(context).copyWith(
              fontSize: 24,
              color: navyBlueColor
            ),),
            const SizedBox(height: 10,),
            const CategoryList(),
            const SizedBox(height: 20,),
            Text('Most famous trip',style: AppTextStyles.styleSemiBold24(context).copyWith(
              color: basicColor
            ),),
            const SizedBox(height: 20,),
            const TripList(),
            const SizedBox(height: 20,),
        ],
        ),
      ),
    );
  }
}













