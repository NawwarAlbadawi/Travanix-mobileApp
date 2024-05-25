
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          flex: 10,

          child: CustomTextFormField(
            prefix:const Icon(Icons.search_rounded),
            controller: searchController, hintText: 'Search',
            fillColor: greyColor.withOpacity(0.1),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: (){},
          child: Container(
            height:60 ,
            width: 60,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: basicColor
            ),
            child: const Icon(Icons.filter_list,
              color: Colors.white,),
          ),
        )
      ],
    );
  }
}