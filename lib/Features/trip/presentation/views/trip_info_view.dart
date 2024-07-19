import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_bottom_bar.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_info_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';
class TripInfoView extends StatelessWidget {
  const TripInfoView({super.key, required this.model});

  final TripsModelData model;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:navyBlueColor,
        statusBarIconBrightness: Brightness.light
    ));
    return  Scaffold(
    extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor:navyBlueColor,


      resizeToAvoidBottomInset: false,
      appBar: AppBar(
         backgroundColor: Colors.transparent,
        leading:const  BackRowIcon(),
      ),
      body:  TripInfoViewBody(model: model,),

      bottomNavigationBar:   TripBottomBar(model: model,),




    );
  }
}
