
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.roomView);
          },
          child: SizedBox(
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
                              Assets.imagesTest2,
          
                            ),
                          fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
          ),
        ),
        const SizedBox(height: 0,),
        Flexible(child: Text('syria',style: AppTextStyles.styleMedium14(context),))
      ],
    );
  }
}