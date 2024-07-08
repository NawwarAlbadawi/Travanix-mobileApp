import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/map/presentation/views/wiggets/change_layer_button.dart';
import 'package:travanix/Features/map/presentation/views/wiggets/map_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
class MapView extends StatelessWidget {
  const MapView({super.key, this.model});


  final dynamic model;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                color: basicColor,
                  size: 40,
                ),
                onPressed: (){
                  GoRouter.of(context).pop();
                },
              ),
            ),
        ),
        ),
      body:  MapViewBody(controller: MapController(),
        model: model,
      ),

      extendBody: true,
      bottomNavigationBar:const ChangeLayerButton()
    );
  }
}
