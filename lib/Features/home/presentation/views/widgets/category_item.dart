
import 'package:flutter/material.dart';
import 'package:travanix/core/generated/assets.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 1.8/2,
      child: Container(
        decoration:  BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            image:const  DecorationImage(
              //  fit: BoxFit.fill,
                image: AssetImage(
                  Assets.imagesBestPlace,

                )
            )
        ),
      ),
    );
  }
}