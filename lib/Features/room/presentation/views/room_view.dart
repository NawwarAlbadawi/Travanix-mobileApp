
import 'package:flutter/material.dart';
import 'package:travanix/Features/room/presentation/views/widgets/room_view_body.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         leading: const  BackRowIcon(),
        title: Text('Select Room',style: AppTextStyles.styleSemiBold24(context),),

      ),
      body:const  RoomViewBody(),
    );
  }
}
