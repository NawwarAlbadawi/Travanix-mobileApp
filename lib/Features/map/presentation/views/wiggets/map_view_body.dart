import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

import 'package:travanix/Features/map/presentation/views/wiggets/map_item_details.dart';


import 'package:travanix/Features/map/presentation/views_model/init_map_services_cubit.dart';


import 'package:travanix/core/styles/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
class MapViewBody extends StatelessWidget {
   const MapViewBody({super.key,  required this.controller, this.model});

  final dynamic  model;

  final MapController controller ;

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<InitMapCubit,InitMapState>(
      builder: (context,state)
      {
        return ConditionalBuilder(
          condition:state is InitMapServicesLoading,
          builder:(context)=>const Center(child:  CircularProgressIndicator()),
          fallback: (context) {
            return FlutterMap(
              mapController: controller,

              options:  MapOptions(
                initialCenter: LatLng( model==null?InitMapCubit.get(context).getLocation.latitude!:model.coordinateX!
                    , model==null? InitMapCubit.get(context).getLocation.longitude!:model.coordinateY!),
                initialZoom: 9.2,
              ),

              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',),
                 MarkerLayer(markers: [
                  if (model!=null)
                    Marker(point:LatLng(model.coordinateX!!, model.coordinateY!!)
                      , child: IconButton(icon:const Icon(FontAwesomeIcons.mapPin,
                  color: basicColor,),
                      onPressed: (){
                        showBottomSheet(
                          backgroundColor: Colors.transparent,
                            enableDrag: true,

                            context: context, builder: (context)=> MapItemDetails(
                          hotelData: model,
                        ));
                      },))
                 ]),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                    ),],
                ),
                  CircleLayer(circles: [
                  CircleMarker(point:LatLng(InitMapCubit.get(context).getLocation.latitude!, InitMapCubit.get(context).getLocation.longitude!)
                      , radius:5,
                      color: navyBlueColor,
                      borderStrokeWidth: 5,
                      borderColor: basicColor
                  )
                ])
              ],
            );
          },
        );
      }

    );
  }
}


