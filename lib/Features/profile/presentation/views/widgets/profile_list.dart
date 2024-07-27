import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/utils/routers.dart';
import '../../../data/models/profile_view_model.dart';
import 'profile_item.dart';
class ProfileList extends StatefulWidget {
  const ProfileList({super.key});

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  final List<ProfileViewModel> list =[
    ProfileViewModel(name: 'Edit your information', icon: Icons.perm_identity_outlined, router:AppRouter.editProfileView),
    ProfileViewModel(name: 'See your wallet', icon: Icons.wallet, router:AppRouter.walletView),
    ProfileViewModel(name: 'Edit your password', icon: Icons.password, router:AppRouter.restPasswordUsingEmail),
  ] ;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(basicRadius),

            boxShadow:const  [
              BoxShadow(
                  color: greyColor,
                  offset: Offset(0,2),
                  blurRadius: 5
              )
            ]

        ),

        child: ListView.separated(
          itemBuilder: (context,index)=>ProfileItem(text: list[index].name, icon: list[index].icon, router: list[index].router),
          itemCount: 3,
          separatorBuilder: (context,state)=>const Divider(thickness: 3,height: 2,),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics:const NeverScrollableScrollPhysics(),
        )

    );
  }
}
