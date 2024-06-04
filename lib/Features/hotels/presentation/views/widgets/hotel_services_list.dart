import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class HotelServicesList extends StatelessWidget {
  const HotelServicesList({super.key, required this.services});
  final List<String> services;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height*0.1,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          itemBuilder: (context,index)=> Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 8.0),
            child:  CircleAvatar(
              radius: MediaQuery.sizeOf(context).height*0.04,
              backgroundColor: greyColor,
              foregroundColor: Colors.white,
              child: Text(services[index],
              style: AppTextStyles.styleMedium14(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
          )
      ),
    );
  }
}