import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/search/presentation/views_models/search_cubit/search_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context,state) {
        var cubit=SearchCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filter',style: AppTextStyles.styleMedium20(context),),
            const SizedBox(height: 20,),
            CSCPicker(
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
                child: Text('${cubit.avgRate}')),
            Slider(
              min: 0,
              max: 10,
              divisions: 20,
              activeColor: basicColor,
                value: cubit.avgRate,
                onChanged: (value){
              cubit.changeSlider(value);
                })
          ],
        );
      }
    );
  }
}
