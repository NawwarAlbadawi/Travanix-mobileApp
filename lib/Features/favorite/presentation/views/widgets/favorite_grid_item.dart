import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/generated/assets.dart';
class FavoriteGridItem extends StatelessWidget {
  const FavoriteGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Stack(
          fit: StackFit.expand,

          children: [
            Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(basicRadius),
              //  border: Border.all(color: basicColor),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.5),
                    blurRadius: 7
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                   borderRadius:  BorderRadius.circular(basicRadius),
                      child: Image.asset(Assets.imagesTest2,fit: BoxFit.cover,),),
                  const SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text('Burj Al Arab',style: AppTextStyles.styleSemiBold20(context), maxLines: 1,
                    ),
                  )
                ],
              ),


            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
                child: IconButton(onPressed: (){}, icon: const Icon(IconlyBold.heart,color: Colors.red,)))
          ],
        );

        // //Text('BurjAlArab')

  }
}
