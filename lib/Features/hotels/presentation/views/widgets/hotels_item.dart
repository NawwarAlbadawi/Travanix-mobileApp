
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_item_bar.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';
class HotelsItem extends StatelessWidget {
  const HotelsItem({super.key, required this.hotelsModel, required this.index});

  final HotelsModel hotelsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).push(AppRouter.hotelView,
          extra: hotelsModel.data[index]);
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
                        aspectRatio: 2.2,
                        child: Image(
                          image: NetworkImage('http://$ip:8001 ${hotelsModel.data[index].images[0]}',),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                     HotelsItemBar(
                    index: index,
                       hotelsModel: hotelsModel,
                     ),
                  ],
                ),
                const SizedBox(height: 2,),
                Text(hotelsModel.data[index].name,style: AppTextStyles.styleSemiBold24(context).copyWith(
                    color: basicColor
                ),),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text('120/night',style: AppTextStyles.styleSemiBold16(context),),
                ),
                Text(hotelsModel.data[index].cityName,
                  style: AppTextStyles.styleMedium14(context).copyWith(
                      color: greyColor,
                    fontWeight: FontWeight.w600
                  ),),
              ],
            ),
          ),

        ),
      ),
    );
  }
}