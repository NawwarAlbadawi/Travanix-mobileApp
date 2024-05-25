
import 'package:flutter/material.dart';
import 'package:travanix/core/generated/assets.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.11,
          child: AspectRatio(
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
              ),
        ),
        const SizedBox(height: 5,),
        Text('syria',style: AppTextStyles.styleMedium14(context),)
      ],
    );
  }
}