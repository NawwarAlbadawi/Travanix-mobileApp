
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:travanix/Features/on_boarding/data/models.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';


class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.item, required this.controller, required this.pageIndex});
  final OnBoardingModel item;
 final PageController controller;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //const Spacer(),
       const SizedBox(height: 30,),
        AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: AssetImage(
                item.image
            ),
            fit: BoxFit.fitHeight,

          ),
        ),
       //const Spacer(),
        const SizedBox(height: 60,),

        Text(
          item.title,
          style: AppTextStyles.styleSemiBold20(context).copyWith(
            fontSize: 40,
            color: basicColor
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          item.subTitle,
          style: AppTextStyles.styleSemiBold18(context),
        ),
        const SizedBox(height: 20,),


      ],
    );
  }
}