import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,  this.radius=20, required this.prefix, this.suffix, this.onChange, this.onFieldSubmitted, required this.controller,  this.isPassword=false,  this.hintText, this.validator,  this.textInputType=TextInputType.text, this.fillColor, this.labelText});
  final double radius;
  final Widget prefix;
  final Widget ? suffix;
  final Function (String ) ? onChange;
  final Function (String) ? onFieldSubmitted;
  final String ? Function  ( String? )?  validator;
  final TextEditingController controller;
  final bool ? isPassword;
  final String ? hintText;
  final String ? labelText;
  final TextInputType textInputType;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor !=null? true:false,
        prefixIconColor: basicColor,
        suffixIconColor: navyBlueColor,

        border: buildOutlineInputBorder(),
        prefixIcon:prefix,
        suffixIcon: suffix,
        labelText: hintText,
        hintText: labelText,

        labelStyle: AppTextStyles.styleSemiBold16(context).copyWith(
          color: Colors.black
        ),
        focusedBorder: buildOutlineInputBorder(),






      ),
      cursorRadius:const  Radius.circular(20),
      cursorColor: navyBlueColor,

      onChanged: onChange,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,

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
