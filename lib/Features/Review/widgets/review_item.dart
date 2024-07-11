import 'package:flutter/material.dart';
import 'package:travanix/Features/Review/data/models/GetReviewModel.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/rating_bar.dart';
import 'package:travanix/generated/assets.dart';
class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.model});
  final GetReviewModelData model;

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

                Text(model.comment!,
                  style: AppTextStyles.styleSemiBold20(context),),
                Row(
                  children: [
                    CustomRatingBar(rating: model.rate!.toDouble(),ignoreTouch: true,size: 23,),
                    const   Spacer(),
                    SizedBox(
                      height:40,
                      width: 40,

                      child: Image.asset(Assets.imagesLogo2,fit: BoxFit.fill,),
                    )
                  ],
                ),
                Text(model.touristName!,style: AppTextStyles.styleMedium16(context),)
              ],
            ),
          )),
    );
  }
}
