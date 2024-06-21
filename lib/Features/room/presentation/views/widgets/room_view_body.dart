


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:travanix/Features/room/presentation/views/widgets/check_in_and_out_container.dart';

import 'package:travanix/Features/room/presentation/views/widgets/rooms_selection.dart';
import 'package:travanix/Features/room/presentation/views_model/select_room_cubit.dart';

import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';

import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_toast.dart';

class RoomViewBody extends StatelessWidget {
  const RoomViewBody({super.key});

  @override
  Widget build(BuildContext context) {




    return   BlocProvider(
      create: (context)=>SelectRoomCubit(),
      child: BlocBuilder<SelectRoomCubit,SelectRoomState>(
        builder: (context,state) {
          SelectRoomCubit cubit=SelectRoomCubit.get(context);
          return Padding(
            padding: const  EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children :[
                     SizedBox(height: MediaQuery.sizeOf(context).height*0.18,),
                    const Row(
                    children: [
                       CheckInAndOutContainer(text: 'Check In') ,
                       SizedBox(width: 5,),
                        CheckInAndOutContainer(text: 'Check Out',),

                    ],
                  ),
                    const SizedBox(height: 50,),
                    const RoomsSelection(
                      rowIcon: Icons.hotel_outlined,
                      containerLeftIcon:FontAwesomeIcons.minus,
                      containerRightIcon: FontAwesomeIcons.plus,
                      text: 'Room count',

                    ),
                    const Divider(height: 5,color: greyColor,),
                   const  RoomsSelection(
                      rowIcon:Icons.people_alt_outlined,
                      containerLeftIcon:FontAwesomeIcons.minus,
                      containerRightIcon: FontAwesomeIcons.plus,
                      text: 'Person count',

                    ),
                    const  Divider(height: 5,color: greyColor,),
                    const SizedBox(height: 30,),
                    CustomMaterialButton(onPressed: (){



                      print(DateFormat('yMMMMd').parse(cubit.checkInController.text));

                      DateTime dateCheckIn=DateFormat('yMMMMd').parse(cubit.checkInController.text);
                      DateTime dateCheckOut=DateFormat('yMMMMd').parse(cubit.checkOutController.text);
                      if(DateTime(dateCheckIn.year,dateCheckIn.month,dateCheckIn.day).isAfter(DateTime(dateCheckOut.year,dateCheckOut.month,dateCheckOut.day)))
                        {
                          print('dsf');
                          const  CustomToast().build(context: context,color: Colors.red,text: 'Please enter valid date');
                        }





                    },
                       text: 'Book now',
                       width: double.infinity,
                   radius: basicRadius,
                   height: 60,)




                  ]
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}




