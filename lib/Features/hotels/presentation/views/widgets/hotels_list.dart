
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_item.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';

import '../../../data/repositories/get_hotels_repo.dart';

class HotelSList extends StatelessWidget {
  const HotelSList({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<GetAllHotelCubit,GetAllHotelState>(
      builder: (context,state)
      {
        var cubit=GetAllHotelCubit.get(context);

        return ConditionalBuilder(
            condition:GetAllHotelCubit.get(context).hotelsModel!=null ,
            builder: (context){
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:(context,index)=>  Padding(
                    padding: const  EdgeInsets.symmetric(vertical: 16.0,horizontal: 15),
                    child:  HotelsItem(hotelsModel: cubit.hotelsModel!,index:index),
                  ) ,

                  itemCount: cubit.hotelsModel!.data.length);
            }, fallback: (context){
              return Column(
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.3,),
                  const Center(child: CircularProgressIndicator()),
                ],
              );
        });







      },

    );
  }
}