
import 'package:flutter/material.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/login_way_item.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/generated/assets.dart';

class SecondWayOfLogin extends StatelessWidget {
  const SecondWayOfLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const  Column(
      children: [
        Spacer(),
        LoginWayItem(text: 'Login with Google', image: Assets.imagesGoogle),
        SizedBox(height: 10,),
        LoginWayItem(text: 'Login with Facebook', image: Assets.imagesFacebook),
        Spacer()
      ],
    );
  }
}