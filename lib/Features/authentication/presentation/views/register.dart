import 'package:flutter/material.dart';
import 'package:travanix/Features/authentication/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),
      ),
      body:const  RegisterViewBody(),
    );
  }
}
