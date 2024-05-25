import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:travanix/Features/map/presentation/views_model/init_map_services_cubit.dart';


import 'package:travanix/core/styles/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  final controller = MapController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }







  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context)=>InitMapCubit()..initMapService(),
      child: BlocBuilder<InitMapCubit,InitMapState>(
        builder: (context,state)
        {
          return ConditionalBuilder(
            condition:state is InitMapServicesLoading,
            builder:(context)=>const Center(child:  CircularProgressIndicator()),
            fallback: (context) {
              return FlutterMap(
                mapController: controller,

                options:  MapOptions(

                  initialCenter: LatLng(InitMapCubit.get(context).getLocation.latitude!, InitMapCubit.get(context).getLocation.longitude!),



                  initialZoom: 9.2,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',),
                  // const MarkerLayer(markers: [
                  //   Marker(point:LatLng(51.509364, -0.128928) , child: Icon(Icons.location_pin,
                  //   color: basicColor,))
                  // ]),
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

      ),
    );
  }
}
