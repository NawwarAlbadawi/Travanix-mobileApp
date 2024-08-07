

import 'package:flutter/material.dart';

import 'package:travanix/Features/profile/presentation/views/widgets/wallet_view_body.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        leading:const  BackRowIcon(),
      ),
      body: const  WalletViewBody(),
    );
  }
}
