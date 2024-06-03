
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        
        leading: IconButton(
          icon:const  Icon(Icons.arrow_back_ios,
          color: basicColor,),
          onPressed: (){
            GoRouter.of(context).pop();
          },
        ),
        title: Text('Discover the hotels',style: AppTextStyles.styleSemiBold24(context),),
      ),
      body:const  HotelsViewBody(),
    );
  }
}
