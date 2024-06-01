import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
class BookRoomBar extends StatelessWidget {
  const BookRoomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Text('210', style: AppTextStyles.styleBold35(context).copyWith(color:basicColor),),
          Text('/Night', style: AppTextStyles.styleSemiBold16(context).copyWith(color:greyColor).copyWith(
              textBaseline: TextBaseline.alphabetic
          ), ),
          const Spacer(),
          CustomMaterialButton(onPressed: (){}, text:'Book Now',
            radius: 15,
            height: 40,
          )
        ],
      ),
    );
  }
}
