import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/search/presentation/views/widgets/hotel_class_list.dart';
import 'package:travanix/Features/search/presentation/views_models/search_for_hotel_cubit/search_for_hotel_cubit.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/generated/assets.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
class HotelFilter extends StatefulWidget {
  const HotelFilter({super.key});

  @override
  State<HotelFilter> createState() => _HotelFilterState();
}

class _HotelFilterState extends State<HotelFilter> {
  List<String>starImages=[
    Assets.imagesOneStar,
    Assets.imagesTwoStars,
    Assets.imagesThreeStars,
    Assets.imagesFourStars,
  ];
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<SearchForHotelCubit,SearchForHotelState>(
        builder: (context,state) {
          var cubit=SearchForHotelCubit.get(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filter',style: AppTextStyles.styleMedium20(context),),
              const SizedBox(height: 20,),
              CSCPicker(
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(basicRadius),
                  color: basicColor.withOpacity(0.6)
                ),
                dropdownDialogRadius: basicRadius,

                disabledDropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(basicRadius),
                  color: greyColor.withOpacity(0.6)
                ),


                showCities: false,
                onCountryChanged: (value) {
                  cubit.changeCountry(value);
                },

                onStateChanged: (value)
                {
                  cubit.changeCity(value);
                },
                onCityChanged: (value)
                {

                },



              ),
              const SizedBox(height: 20,),
              Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(' Avg Rate :${cubit.avgRate.ceilToDouble()}')),
              Slider(
                  min: 0,
                  max: 10,
                  activeColor: basicColor,
                  value: cubit.avgRate.ceilToDouble(),
                  onChanged: (value){
                    cubit.changeSlider(value);
                  }),
              const HotelClassList()

            ],
          );
        }
    );
  }
}


