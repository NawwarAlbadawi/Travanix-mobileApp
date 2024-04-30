
import 'package:flutter/material.dart';
import 'package:travanix/Features/on_boarding/data/models.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({required this.item});
  final OnBoardingModel item;

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Image(
          image: AssetImage(
              item.image
          ),
          fit: BoxFit.fitHeight,
          height: 300,
        ),
        const Spacer(),
        Text(
          '${item.title}',
          style: AppTextStyles.styleSemiBold20(context).copyWith(
            fontSize: 40,
            color: basicColor
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${item.subTitle}',
          style: AppTextStyles.styleSemiBold18(context),
        ),
        const SizedBox(height: 30,),

      ],
    );
  }
}