import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text, required this.isActive});

  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return  isActive?CustomActiveContainer(text: text):CustomInActiveContainer(text: text);
  }
}
class CustomActiveContainer extends StatelessWidget {
  const CustomActiveContainer({super.key, required this.text});

  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: 15,vertical: 8),

      decoration: BoxDecoration(
          color: basicColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: basicColor.withOpacity(0.5)
          ),
          boxShadow:const [
            BoxShadow(
                color: CupertinoColors.lightBackgroundGray,
                blurRadius: 5
            )
          ]
      ),
      child: Center(child: Text(text,style: AppTextStyles.styleSemiBold16(context).copyWith(
        color: Colors.white
      ),)),
    );
  }
}
class CustomInActiveContainer extends StatelessWidget {
  const CustomInActiveContainer({super.key, required this.text});

  final String text;


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const  EdgeInsets.symmetric(horizontal: 15,vertical: 8),

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: basicColor.withOpacity(0.5)
          ),
          boxShadow:const [
            BoxShadow(
                color: CupertinoColors.lightBackgroundGray,
                blurRadius: 5
            )
          ]
      ),
      child: Center(child: Text(text,style: AppTextStyles.styleSemiBold16(context),)),
    );
  }
}