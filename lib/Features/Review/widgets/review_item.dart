import 'package:flutter/material.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/rating_bar.dart';
import 'package:travanix/generated/assets.dart';
class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 10),
      child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(basicRadius),
              border: Border.all(color: navyBlueColor)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const  CustomRatingBar(rating: 4,),
                    const   Spacer(),
                    SizedBox(
                      height:50,
                      width: 50,
                      child: Image.asset(Assets.imagesLogo2,fit: BoxFit.fill,),
                    )
                  ],
                ),
                Text('Burj Al Arab Hotel is one of the finest, most luxurious and most beautiful hotels in the world. The Burj Al Arab Jumeirah Hotel is located on its own island and features suites with sea views, 8 distinct restaurants, a full-service spa and distinctive parking',
                  style: AppTextStyles.styleSemiBold20(context),),
              ],
            ),
          )),
    );
  }
}
