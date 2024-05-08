import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/login_screen_body.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,

    ));

    return  Scaffold(

      body: LoginScreenBody(),
    );
  }
}
