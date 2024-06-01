
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/rating_bar.dart';
import 'package:travanix/generated/assets.dart';

class MapItemDetails extends StatelessWidget {
  const MapItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: navyBlueColor,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height*.2
        ),
        
        width: double.infinity,
        child: SingleChildScrollView(
          physics:const  BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*.3,
                  child:  AspectRatio(
                    aspectRatio: 1,
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: const Image(image: AssetImage(
                        Assets.imagesTest,

                      ), fit: BoxFit.fill,),
                    ) ,
                  ),
                ),
                const SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width*.4,
                      child: Text('Syria hotel ', style: AppTextStyles.styleSemiBold24(context).copyWith(color: basicColor,),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,),
                    ),
                    const  SizedBox(height: 5,),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width*.4,
                      child: Text('Syria hotel ', style: AppTextStyles.styleSemiBold16(context).copyWith(color: greyColor,),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                    ),
                    const  SizedBox(height: 20,),
                    const IgnorePointer(
                      ignoring: true,
                      child: CustomRatingBar(),
                    )
                  ],
                ),












              ],
            ),
          ),
        ),
      ),
    );
  }
}