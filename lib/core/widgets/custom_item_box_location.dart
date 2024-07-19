
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import '../../Features/map/presentation/views/wiggets/map_view_body.dart';
import '../utils/routers.dart';

class CustomItemBoxLocation extends StatelessWidget {
  const CustomItemBoxLocation({
    super.key,
     this.model, this.aspectRatio, this.shadow,
  });

  final dynamic model;
  final double ? aspectRatio;
  final BoxShadow ? shadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.mapView, extra: model);
      },
      child:   AspectRatio(
        aspectRatio: aspectRatio?? 3,
        child: Container(
          height: MediaQuery.sizeOf(context).height*.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              //border: Border.all(color: ligh,),
              boxShadow:   [

                shadow??const BoxShadow(
                    color: CupertinoColors.lightBackgroundGray,
                    offset:  Offset(0,2),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 15
                )]),
          width: double.infinity,

          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:  IgnorePointer(
                  ignoring: true,
                  child:  MapViewBody(controller: MapController(),model: model,))),
        ),
      ),
    );
  }
}