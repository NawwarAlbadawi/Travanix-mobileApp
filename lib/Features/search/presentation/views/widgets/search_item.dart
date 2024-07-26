
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/rating_bar.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_image.dart';
class SearchItem extends StatelessWidget {
  const SearchItem({super.key, this.model});
 final dynamic model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.15,


      decoration: BoxDecoration(
         color: Colors.white,
        borderRadius: BorderRadius.circular(basicRadius),
        boxShadow:const  [
          BoxShadow(
            color: CupertinoColors.lightBackgroundGray,
            blurRadius: 5
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImage(image: url+model.images[0], aspectRatio: 1.2,clipBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(basicRadius),
            bottomLeft: Radius.circular(basicRadius)
          ),),
          const SizedBox(width: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name,style: AppTextStyles.styleSemiBold24(context).copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 22

                  ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10,),
                  Text(model.address),
                  const Spacer(),
                  CustomRating(
                    rating: model.rating,
                    iconSize: 15,
                    color: basicColor,

                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(IconlyBold.heart,color: model.favorite?Colors.red:greyColor,),
          )
        ],
      ),
    );
  }
}
