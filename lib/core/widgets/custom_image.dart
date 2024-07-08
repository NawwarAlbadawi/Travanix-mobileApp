import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image, required this.aspectRatio, this.fit});
  final String image;
  final double aspectRatio;
  final BoxFit ? fit;
  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: aspectRatio,
     child:CachedNetworkImage(
       imageUrl: image,
       fit: fit??BoxFit.fill,
       errorWidget:(context,url,error)=>const Icon(Icons.image_not_supported_outlined),
     ) ,

    );
  }
}
