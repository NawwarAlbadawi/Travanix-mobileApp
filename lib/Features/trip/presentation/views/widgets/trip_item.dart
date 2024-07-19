
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_favorite_icon_button.dart';

import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';

class TripItem extends StatelessWidget {
  const TripItem({super.key, required this.model});

  final TripsModelData model;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.tripInfo,extra:model );
      },
      child: PhysicalModel(
        color: greyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        elevation: 10,
        shadowColor: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                  borderRadius: BorderRadius.circular(20),
                  image:   DecorationImage(
                    fit: BoxFit.cover,
                     // opacity:0.8,
                    colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.3),
                      BlendMode.saturation,),
                      filterQuality: FilterQuality.high,
                      image:const  AssetImage(
                        Assets.imagesTest,


                      ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width*.055,
                  backgroundColor: Colors.white,
                  child: TripFavoriteIconButton(id: model.id!)),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.nationName!,style: AppTextStyles.styleBold35(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24
                    ),),
                    Text(model.tripStartTime!.substring(0,10),style: AppTextStyles.styleBold35(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}