import 'package:flutter/material.dart';
import 'package:travanix/Features/profile/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';
class  EditProfileView extends StatelessWidget {
  const  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const  BackRowIcon(),
        title: Text('Edit Your Profile',style: AppTextStyles.styleSemiBold24(context).copyWith(

        ),),
      ),
      body: const  EditProfileViewBody(),
    );
  }
}
