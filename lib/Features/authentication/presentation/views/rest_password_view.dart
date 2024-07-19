import 'package:flutter/material.dart';

import 'package:travanix/Features/authentication/presentation/views/widgets/rest_password_view_body.dart';
class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(

      body:  RestPasswordViewBody(),
    );
  }
}
