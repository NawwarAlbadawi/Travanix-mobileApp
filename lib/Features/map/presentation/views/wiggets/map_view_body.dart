import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

import 'package:travanix/Features/map/presentation/views/wiggets/map_item_details.dart';


import 'package:travanix/Features/map/presentation/views_model/init_map_services_cubit.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';


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
                initialZoom: 13,
              ),

              children: [

                if(InitMapCubit.get(context).isWMS)
                    TileLayer(

                      //urlTemplate: 'https://{s}.s2maps-tiles.eu/wms/?',

                      wmsOptions:  WMSTileLayerOptions(
                        baseUrl: 'https://{s}.s2maps-tiles.eu/wms/?',
                        layers: const ['s2cloudless-2021_3857'],
                      ),
                      userAgentPackageName: 'com.example.app',


                      subdomains: const ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
                    ),
                if(!InitMapCubit.get(context).isWMS)
                      TileLayer(

                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'TravanixApp',


            subdomains: const ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
            ),
                MarkerLayer(markers: [
                  if (model!=null)

                    Marker(point:LatLng(model.coordinateX!!, model.coordinateY!!)
                      , child: IconButton(icon:const Icon(FontAwesomeIcons.mapPin, color: basicColor,),
                      onPressed: (){
                        if(model is !TripsModelData){
                        showBottomSheet(
                          sheetAnimationStyle: AnimationStyle(
                            curve: Curves.easeInOut
                          ),
                          backgroundColor: Colors.transparent,
                            enableDrag: true,
                            context: context, builder: (context)=> MapItemDetails(
                          modelData: model,
                        ));}
                      },))
                 ]),
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                    ),],
                ),
                CircleLayer(circles: [CircleMarker(point:LatLng(InitMapCubit.get(context).getLocation.latitude!, InitMapCubit.get(context).getLocation.longitude!)
                      , radius:5,
                      color: navyBlueColor,
                      borderStrokeWidth: 3,
                      borderColor: Colors.blue
                  ),]),


              ],
            );
          },
        );
      }

    );
  }
}


