


import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';


import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:travanix/Features/home/presentation/views/widgets/category_list.dart';
import 'package:travanix/Features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:travanix/Features/home/presentation/views/widgets/home_view_body.dart';

import 'package:travanix/Features/home/presentation/views/widgets/trip_item.dart';
import 'package:travanix/Features/home/presentation/views/widgets/trip_list.dart';
import 'package:travanix/Features/map/presentation/views/wiggets/map_view_body.dart';
import 'package:travanix/core/generated/assets.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>  {



  @override
  void initState()  {
    // TODO: implement initState



    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 90.0,
        left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // const SizedBox(height: 90,),
            Text('Explore and Find ',
           style: AppTextStyles.styleMedium24(context),),
            const SizedBox(height: 5,),
            Text('Your Best Journey ',
              style: AppTextStyles.styleSemiBold24(context),),
            const SizedBox(height: 20,),
            const CustomSearchBar(),
            const SizedBox(height: 30,),
            Text('Category',style: AppTextStyles.styleBold18(context),),
            const SizedBox(height: 10,),
            const CategoryList(),
            const SizedBox(height: 20,),
            Text('Most famous trip',style: AppTextStyles.styleSemiBold20(context),),
            const SizedBox(height: 20,),
            const TripList(),
           const SizedBox(height: 20,),
           const  SizedBox(
              height: 300,
              width: double.infinity,
              child:  MapViewBody(),
            )






        ],
        ),
      ),
    );
  }
}













