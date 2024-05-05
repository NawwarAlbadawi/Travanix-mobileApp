import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/widgets/otp_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.email});
  final  String email;


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_ios_new,

          ),
          onPressed:(){
            GoRouter.of(context).pop();
          },
        ),
      ),
      body:OTPBody(email: email,) ,
    );
  }
}

