import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/search/presentation/views/widgets/hotel_class_list_item.dart';
import 'package:travanix/Features/search/presentation/views_models/search_for_hotel_cubit/search_for_hotel_cubit.dart';
class HotelClassList extends StatelessWidget {
  const HotelClassList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForHotelCubit,SearchForHotelState>(
      builder:(context,state){
        var cubit=SearchForHotelCubit.get(context);
        return SizedBox(
        height: 45,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index)=>GestureDetector(
            onTap: (){
              cubit.changeHotelClass(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0,bottom: 4),
              child: HotelClassListItem(star: index+1, isActive: index==cubit.hotelClassIndex,),
            ),
          ),
          itemCount: 5, ),);
      });
  }
}
