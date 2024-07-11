import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.padding});
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            flex: 10,
           child: Container(
             height: 55,
             padding: const  EdgeInsets.all(8),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.white,
               border: Border.all(
                 color: navyBlueColor
               ),
               boxShadow:  [
                 BoxShadow(
                   blurRadius: 5,
                   color: greyColor.withOpacity(0.6)
                 )
               ]
             ),
             child: Row(
               children: [
                 const Icon(FontAwesomeIcons.magnifyingGlass,size: 20,),
                 const SizedBox(width: 15,),
                 Text('Search',style: AppTextStyles.styleSemiBold18(context),)
               ],
             ),
           ),
          ),
          const SizedBox(width: 10,),
          GestureDetector(
            onTap: (){},
            child: Container(
              height:55 ,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: basicColor,
                boxShadow: const  [
                  BoxShadow(
                      blurRadius: 5,
                      color: greyColor
                  )
                ]
              ),
              child: const Icon(Icons.tune_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}