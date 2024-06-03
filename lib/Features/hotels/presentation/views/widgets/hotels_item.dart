
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_item_bar.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';
class HotelsItem extends StatelessWidget {
  const HotelsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).push(AppRouter.roomView);
        },
        child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(basicRadius),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: navyBlueColor.withOpacity(0.4),
                    offset: const Offset(0,2),
                    blurRadius: (5),
                    blurStyle: BlurStyle.normal
                )
              ]

          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: AspectRatio(
                        aspectRatio: 3,
                        child: Image.asset(Assets.imagesTest,fit: BoxFit.fill,
                          width: double.infinity,),
                      ),
                    ),
                  const   HotelsItemBar(),
                  ],
                ),
                const SizedBox(height: 2,),
                Text('Salaawi Hotel',style: AppTextStyles.styleSemiBold24(context).copyWith(
                    color: basicColor
                ),),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text('120/night',style: AppTextStyles.styleSemiBold16(context),),
                ),
                Text('Moroco By Ronaldo',
                  style: AppTextStyles.styleMedium14(context).copyWith(
                      color: greyColor
                  ),),
              ],
            ),
          ),

        ),
      ),
    );
  }
}