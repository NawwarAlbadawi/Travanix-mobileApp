import 'package:flutter/material.dart';
class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image, required this.aspectRatio, this.fit});
  final ImageProvider image;
  final double aspectRatio;
  final BoxFit ? fit;
  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: aspectRatio,
     child:Image(image: image,fit: fit?? BoxFit.cover,) ,

    );
  }
}
