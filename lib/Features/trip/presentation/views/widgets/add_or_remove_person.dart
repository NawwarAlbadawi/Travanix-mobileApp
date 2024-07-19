import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/book_trip_cubit/book_trip_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/widgets/custom_selection_container.dart';
import '../../../data/model/TripsModel.dart';
class AddOrRemovePerson extends StatelessWidget {
  const AddOrRemovePerson({super.key,required this.model});
  final TripsModelData model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookTripCubit,BookTripState>(
      builder:(context,state) {
        var cubit=BookTripCubit.get(context);
        return Row(
          children: [
            CustomSelectionContainer(
                borderRadius: BorderRadius.circular(basicRadius),
                icon:FontAwesomeIcons.minus, onPress: (){
              cubit.removePerson();
                }),
            Flexible(
              child: Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 6.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                    child: Text('${cubit.personCount}',style: AppTextStyles.styleSemiBold20(context),)),
              ),
            ),
            CustomSelectionContainer(borderRadius: BorderRadius.circular(basicRadius),
                icon:FontAwesomeIcons.plus, onPress: (){
              model.numberOfSeatsAvailable!>cubit.personCount?
              cubit.addPerson():null;
                }),
          ],
        );
      },
    );
  }
}
