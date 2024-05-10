import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/rest_password_view_body.dart';
class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back_ios_new,

          ),
          onPressed:(){
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: const RestPasswordViewBody(),
    );
  }
}
