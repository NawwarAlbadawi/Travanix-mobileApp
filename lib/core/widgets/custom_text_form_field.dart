import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,  this.radius=20, required this.prefix, this.suffix, this.onChange, this.onFieldSubmitted, required this.controller,  this.isPassword=false, required this.hintText, this.validator});
  final double radius;
  final Widget prefix;
  final Widget ? suffix;
  final Function (String ) ? onChange;
  final Function (String) ? onFieldSubmitted;
  final String Function  ( String?s )?  validator;
  final TextEditingController controller;
  final bool ? isPassword;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(

        border: buildOutlineInputBorder(),
        prefixIcon:prefix,
        suffixIcon: suffix,
        labelText: hintText,
        labelStyle: AppTextStyles.styleSemiBold16(context).copyWith(
          color: Colors.black
        ),
        focusedBorder: buildOutlineInputBorder(),






      ),

      onChanged: onChange,

      onFieldSubmitted:onFieldSubmitted ,
      controller:controller ,
      obscureText:isPassword !?true:false ,
      validator:validator ,
      onTap: (){


      },

    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide:const BorderSide(
          color: basicColor,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter


        ),







      );
  }
}
