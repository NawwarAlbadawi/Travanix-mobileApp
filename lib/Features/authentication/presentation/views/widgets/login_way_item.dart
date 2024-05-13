import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/generated/assets.dart';
class LoginWayItem extends StatelessWidget {
  const LoginWayItem({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding:const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: Colors.red
          )


      ),
      height: 45,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
             Image(
               image: AssetImage(image),
               fit: BoxFit.contain,),
          const   SizedBox(width: 10,),
          Text(text,
            style: AppTextStyles.styleBold16(context),),

        ],
      ),
    );
  }
}
