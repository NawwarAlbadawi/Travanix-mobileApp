import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/rest_password_using_email_body.dart';
class RestPasswordUsingEmail extends StatelessWidget {
  const RestPasswordUsingEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios),
          onPressed: (){
            GoRouter.of(context).pop();
          },
        ),
      ),
      body:const RestPasswordUsingEmailBody() ,
    );
  }
}
