import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/routers.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import 'add_or_remove_person.dart';
class TripBottomBar extends StatelessWidget {
  const TripBottomBar({super.key, required this.model});

 final TripsModelData model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
              Expanded(child: AddOrRemovePerson(model:model ,)) ,
            Expanded(
              flex: 2,
              child: CustomMaterialButton(
                onPressed: (){
                  GoRouter.of(context).push(AppRouter.tripAddNames,extra: model);
                },
                text: 'Book',
                height: 50,
                radius: basicRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
