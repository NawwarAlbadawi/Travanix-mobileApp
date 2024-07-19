import 'package:flutter/material.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_view_body.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(

        leading:const BackRowIcon(),
        title: Text('Discover the hotels',style: AppTextStyles.styleSemiBold24(context),),
      ),
      body:const  HotelsViewBody(),
    );
  }
}
