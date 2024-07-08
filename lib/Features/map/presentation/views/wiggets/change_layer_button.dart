import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/map/presentation/views_model/init_map_services_cubit.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
class ChangeLayerButton extends StatelessWidget {
  const ChangeLayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitMapCubit,InitMapState>(

      builder: (context,state) {
        var cubit=InitMapCubit.get(context);
        return Padding(
          padding:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width/1.2,bottom: 10,left: 5),
          child: Container(

            width: 20,
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(basicRadius)
            ),
            child: IconButton(icon:
            Icon(Icons.layers_rounded,color: cubit.isWMS?basicColor:Colors.black,size:30,),
              onPressed: (){cubit.toggleBetweenTheLayer();},),
          ),
        );
      }
    );
  }
}
