

import 'package:flutter/material.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/register_loading_view_body.dart';

class RegisterLoadingView extends StatelessWidget {
  const RegisterLoadingView({super.key, required this.email, required this.name, required this.password});
 final String email;
 final String name;
  final String password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:RegisterLoadingViewBody(name: name, email: email,password: password,) ,
    );
  }
}
