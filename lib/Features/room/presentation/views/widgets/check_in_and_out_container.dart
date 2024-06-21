import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travanix/Features/room/presentation/views_model/select_room_cubit.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CheckInAndOutContainer extends StatelessWidget {
  const CheckInAndOutContainer({
    super.key,
    required this.text
  });


  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectRoomCubit,SelectRoomState>(
      builder:(context,state){
        SelectRoomCubit cubit=SelectRoomCubit.get(context);
        return  Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
              Text(text,style: AppTextStyles.styleSemiBold20(context),),
              const SizedBox(height:2,),
              GestureDetector(
                onTap: (){
                  showDatePicker(context: context,
                      firstDate: DateTime.now(),
                      lastDate:DateTime(2100),
                    builder: (context,child){
                    return Theme (
                    data: Theme.of(context).copyWith(
        colorScheme: const  ColorScheme.light(
        primary: basicColor, // header background color
        onPrimary: Colors.white, // header text color
        onSurface: navyBlueColor, // body text color
        ),

        ),
        child: child!,
        );

                    
                    }
                  ).then((value){
                     text=='Check In'? cubit.setCheckInDate(DateFormat.yMMMMd().format(value!)):cubit.setCheckOutDate(DateFormat.yMMMMd().format(value!));
                      });
          
                },
                child:Container(
                  height: 55,
                  width: double.infinity,
                  padding:const  EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(basicRadius),
                      border: Border.all(
                          color: navyBlueColor
                      ),
                      boxShadow: [
                        BoxShadow(
          
                            blurRadius: basicRadius,
                            color: greyColor,
                            offset: const Offset(0, 4)
                        )
                      ]
                  ),
                  child: Row(
          
                    children: [
                      const Icon(Icons.date_range,color: basicColor,),
                      const SizedBox(width: 10,),
          
                     text=='Check In'?Flexible(child: Text(cubit.checkInController.text.isEmpty?text:cubit.checkInController.text, style: AppTextStyles.styleSemiBold18(context),)):
                     Flexible(
                       child: Text(cubit.checkOutController.text.isEmpty?text:cubit.checkOutController.text,
                         style: AppTextStyles.styleSemiBold18(context),),
                     ),
                    ],
                  ),
                ) ,
              ),
            ],
          ),
        );}
    );
  }
}