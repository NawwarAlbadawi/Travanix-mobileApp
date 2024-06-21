

import 'package:flutter/material.dart';
import 'package:travanix/Features/profile/data/models/ProfileModel.dart';
import 'package:travanix/Features/profile/presentation/views/widgets/wallet_view_body.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key, required this.model});
   final ProfileModel model;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        leading:const  BackRowIcon(),
      ),
      body: WalletViewBody(model: model,),
    );
  }
}
