import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/room/presentation/views_model/select_room_cubit.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

import '../../../../../core/widgets/custom_selection_container.dart';
class RoomsSelection extends StatelessWidget {
  const RoomsSelection({
    super.key, required this.rowIcon, required this.text, required this.containerLeftIcon, required this.containerRightIcon,
  });
  final IconData rowIcon;
  final IconData containerLeftIcon;
  final IconData containerRightIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectRoomCubit,SelectRoomState>(
      builder:(context,state) {
        SelectRoomCubit cubit=SelectRoomCubit.get(context);
        return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(rowIcon,
              size: 35,
              color: navyBlueColor,),
            const Spacer(),
            Text(text,style: AppTextStyles.styleSemiBold18(context)),
            const Spacer(),
            CustomSelectionContainer(
              borderRadius: BorderRadius.circular(basicRadius),
              icon: containerLeftIcon,
              onPress: (){
                text=='Room count'?cubit.removeRoom():cubit.removePerson();
              },

            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.white,
              child: Center(
                child: Text(text=='Room count'? '${cubit.roomCount}':'${cubit.personCount}',
                  style: AppTextStyles.styleSemiBold20(context).copyWith(

                  ),),
              ),
            ),
            CustomSelectionContainer(
              borderRadius: BorderRadius.circular(basicRadius),
              icon: containerRightIcon,
              onPress: (){

                text=='Room count'?cubit.addRoom():cubit.addPerson();

              },

            ),

          ],
        ),
      );
      },
    );
  }
}

