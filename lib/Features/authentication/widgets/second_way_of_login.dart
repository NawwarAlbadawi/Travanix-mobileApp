
import 'package:flutter/material.dart';
import 'package:travanix/generated/assets.dart';

class SecondWayOfLogin extends StatelessWidget {
  const SecondWayOfLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const    Spacer(),
        Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

          ),
          height: 50,
          child:const  AspectRatio(
            aspectRatio:1,
            child:  Image(
              image: AssetImage(Assets.imagesGoogle),
              fit: BoxFit.contain,


            ),
          ),
        ),
        const   SizedBox(width: 20,),
        Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),




          ),
          height: 50,
          child:const AspectRatio(
            aspectRatio:1,
            child:  Image(
              image: AssetImage(Assets.imagesFacebook),
              fit: BoxFit.contain,


            ),
          ),
        ),
        const   Spacer()
      ],
    );
  }
}