import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.padding, required this.filterChild, required this.controller, this.onChange, this.applyFunction});
  final EdgeInsetsGeometry padding;
  final Widget filterChild;
  final TextEditingController controller;
  final Function (String?) ? onChange;
  final Function () ? applyFunction;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            flex: 10,
           child: CustomTextFormField(
             controller: controller,
             prefix: const  Icon(FontAwesomeIcons.magnifyingGlass,size: 20,),
             onChange:onChange ,
             labelText: 'Search',
           ),
          ),
          const SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              AwesomeDialog(
                headerAnimationLoop: false,
                padding:const EdgeInsets.all(8),
                dialogBackgroundColor: Colors.white,
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.noHeader,
                body:  Center(child:filterChild,),
                title: 'This is Ignored',
                desc:   'This is also Ignored',
                btnOkColor: basicColor,
                btnOkText: 'Apply',
                buttonsBorderRadius: BorderRadius.circular(basicRadius),
                btnOkOnPress: applyFunction
              ).show();
            },
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