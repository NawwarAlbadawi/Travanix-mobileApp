import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/generated/assets.dart';
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image, required this.aspectRatio, this.fit, this.clipBorderRadius});
  final String image;
  final double aspectRatio;
  final BoxFit ? fit;
  final BorderRadius ? clipBorderRadius;
  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: aspectRatio,
     child:ClipRRect(
       borderRadius: clipBorderRadius??BorderRadius.zero,
       child: CachedNetworkImage(
         imageUrl: image,
         fit: fit??BoxFit.fill,
         errorWidget:(context,url,error)=> Container(
           decoration: BoxDecoration(
             border: Border.all(color: navyBlueColor),
             borderRadius: clipBorderRadius?? BorderRadius.circular(basicRadius)

           ),
             child: ClipRRect(
               borderRadius: clipBorderRadius?? BorderRadius.circular(basicRadius),
                 child: Image.asset(Assets.imagesImageNotFond,fit: BoxFit.fill,))),
       ),
     )

    );
  }
}
