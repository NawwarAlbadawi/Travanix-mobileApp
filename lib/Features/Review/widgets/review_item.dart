import 'package:flutter/material.dart';
import 'package:travanix/Features/Review/data/models/GetReviewModel.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/rating_bar.dart';
import 'package:travanix/generated/assets.dart';
class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.model, this.category});
  final GetReviewModelData model;
  final String ? category;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:10.0,right: 10,bottom: 10),
      child: Container(

          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(basicRadius),

              boxShadow:  [BoxShadow(
                  color:  const  Color(0xFFD3D3D3).withOpacity(0.5),
                  blurRadius: basicRadius
                )]

          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15,top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(model.touristName!,style: AppTextStyles.styleSemiBold20(context).copyWith(
                 fontSize: 18
               ),),
                const SizedBox(height: 5,),
                Text(model.comment!,
                  style: AppTextStyles.styleSemiBold16(context).copyWith(
                    color: greyColor
                  ),),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    CustomRatingBar(rating: model.rate!.toDouble(),ignoreTouch: true,size: 20,),
                    const   Spacer(),
                    SizedBox(
                      height:40,
                      child: Image.asset(Assets.imagesLogo2,fit: BoxFit.fill,),
                    )
                  ],
                ),

              ],
            ),
          )),
    );
  }
}
