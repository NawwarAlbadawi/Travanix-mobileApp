

import 'package:flutter/material.dart%20';
import 'package:travanix/Features/authentication/presentation/views/widgets/otp_item.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../generated/assets.dart';

class OtpUi extends StatelessWidget {
  const OtpUi({
    super.key,
    required this.email,
    required this.controllers,
  });

  final String email;
  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio:1.3 ,
          child: Container(
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image:AssetImage(
                        Assets.imagesOTP
                    )
                )
            ),
          ),),
        Text('Verify your email',
          style: AppTextStyles.styleSemiBold24(context).copyWith(
              fontSize: 30
          ),),
        const SizedBox(height: 5),
        Text('We just sent the code to  ' ,
          style: AppTextStyles.styleSemiBold18(context),),
        const SizedBox(height: 5),
        Text(email ,
          style: AppTextStyles.styleMedium16(context).copyWith(
              color: basicColor
          ),),
        const SizedBox(height: 30,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) => OTPItem(
            controller:controllers[index] ,
            index: index,
          ) ),
        ),
      ],
    );
  }
}