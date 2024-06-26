
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/Features/map/presentation/views/wiggets/map_item_details.dart';
import 'package:travanix/Features/map/presentation/views/wiggets/map_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
class MapView extends StatelessWidget {
  const MapView({super.key, this.latitude, this.longitude, this.model});

  final double ? latitude;
  final double ? longitude;
  final dynamic model;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        leading: CircleAvatar(
          backgroundColor: navyBlueColor,
          child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                color: basicColor,
                ),
                onPressed: (){

                  GoRouter.of(context).pop();
                },
              ),
            ),
        ),
        ),



      body:  MapViewBody(controller: MapController(),
      latitude: latitude,
      longitude: longitude,
        model: model,
      ),
    );
  }
}
