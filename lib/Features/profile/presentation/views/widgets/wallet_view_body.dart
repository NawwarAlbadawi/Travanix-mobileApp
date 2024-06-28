



import 'package:flutter/material.dart';
import 'package:travanix/Features/profile/presentation/views/widgets/charge_wallet_section.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/generated/assets.dart';
import '../../../data/models/ProfileModel.dart';
class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key, required this.model});
  final ProfileModel model;


  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
      child: SingleChildScrollView(
        physics: const  BouncingScrollPhysics(),
        child: Column(
          children: [

            AspectRatio(
              aspectRatio: 5/3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),


                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(basicRadius),
                  gradient: LinearGradient(colors: [
                    basicColor,
                    basicColor.withOpacity(0.8)
                  ])
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width*0.2,

                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(Assets.imagesLogo,
                          fit: BoxFit.cover,),
                        )),
                  ),
                    const SizedBox(height: 5,),
                    Text('Balance',style: AppTextStyles.styleSemiBold18(context).copyWith(
                      color: Colors.white
                    ),),
                    const SizedBox(height: 10,),
                    Text('\$ 5000',style: AppTextStyles.styleBold35(context).copyWith(
                      color: Colors.white
                    ),),
                   const  Spacer(),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Text(model.createdAt!.substring(0,10),style: AppTextStyles.styleMedium14(context).copyWith(
                        color: Colors.white,
                      ),),
                    )




                ],),
              ),

            ),
            const SizedBox(height: 70,),
            const ChargeWalletSection()


          ],
        ),
      ),
    );
  }
}
