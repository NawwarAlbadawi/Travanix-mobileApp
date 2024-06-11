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
            child:  AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: greyColor.withOpacity(0.3)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(services[index],
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styleRegular12(context).copyWith(
                      color:navyBlueColor,
                      fontWeight: FontWeight.bold

                    ),),
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}