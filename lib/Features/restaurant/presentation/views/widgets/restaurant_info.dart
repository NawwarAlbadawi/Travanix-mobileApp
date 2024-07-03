import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/Review/review_body.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_list_view.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_item_box_location.dart';
class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Divella Bistro Restaurant',style: AppTextStyles.styleSemiBold24(context),),
              const Spacer(),
              IconButton(onPressed: (){}, icon:const Icon(IconlyBold.heart,color: Colors.red,))
            ],
          ),
          Text('Damascus',style: AppTextStyles.styleSemiBold20(context).copyWith(
              color: greyColor
          ),),
          const SizedBox(height: 30,),
          const  RestaurantListView(),
          const SizedBox(height: 40,),
          Row(
            children: [
              Icon(IconlyBold.time_circle,color:basicColor.withOpacity(0.7)),
              const SizedBox(width: 5,),
              Text('Working hours',style: AppTextStyles.styleSemiBold20(context),),
            ],
          ),
          const SizedBox(height: 5,),
          Text('Mon-Sun/ 12.00-2.00',style: AppTextStyles.styleBold18(context).copyWith(
              color: basicColor.withOpacity(0.7),
              fontWeight: FontWeight.w500

          ),),
          const SizedBox(height: 20,),
          const CustomItemBoxLocation(aspectRatio: 2.3,),
          const SizedBox(height: 20,),
          Text('About restaurant',style: AppTextStyles.styleSemiBold24(context).copyWith(
              fontSize: 22
          ),),
          const SizedBox(height: 10,),
          Text('In a striking building overlooking the Arabian Gulf, this sprawling beachfront hotel is 11 minutes walk from Burj Al Arab and 6 km from the Mall of the Emirates.\nUpscale rooms with gulf views feature decor ranging from modern to muted, plus floor-to-ceiling windows',
            style: AppTextStyles.styleMedium16(context),

          ),
          const SizedBox(height: 30,),
         const  ReviewBody(category: 'category', id:1)



        ],
      ),
    );
  }
}