import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travanix/Features/profile/presentation/views/profile_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(

      body: ProfileViewBody(),
    );
  }
}
