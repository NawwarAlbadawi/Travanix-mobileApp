
import 'package:flutter/material.dart%20';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/add_names_fields.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';

import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/widgets/back_row_Icon.dart';

class BookingTripDetailsView extends StatelessWidget {
  const BookingTripDetailsView({super.key, required this.model});
 final TripsModelData model;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:const  BackRowIcon(),

        title: Text('Booking trip details',style: AppTextStyles.styleSemiBold24(context),),

      ),

      body:   AddNamesFields(model:model ,),


    );
  }
}
