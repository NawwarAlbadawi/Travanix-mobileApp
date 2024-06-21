import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
class ChargeWalletSection extends StatelessWidget {
  const ChargeWalletSection({super.key});




  @override
  Widget build(BuildContext context) {
    final TextEditingController controller=TextEditingController();
    GlobalKey<FormState> formKey=GlobalKey<FormState>();
    return  BlocConsumer<ProfileCubit,ProfileState>(
        listener: (context,state){
          if(state is ChargeWalletSuccess)
            {

            }

        },
        builder: (context,state){

          return Form(
            key: formKey,
            child: Column(
              children: [

                Text('Charge Wallet',style: AppTextStyles.styleBold35(context),),
                const SizedBox(height: 20,),
                CustomTextFormField(
                    prefix:const Icon(Icons.wallet) ,
                    controller: controller,
                    labelText: 'Put the code to charge the wallet',
                  validator: (string){
                      if(string!.isEmpty)
                        {
                          return 'The code is not valid ';
                        }
                      return null;
                  },

                ),
                const SizedBox(height: 20,),
                ConditionalBuilder(
                  condition: state is ChargeWalletLoading,
                  builder: (context)=>const  Center(child: CircularProgressIndicator(),),
                  fallback: (context)=>CustomMaterialButton(
                    onPressed: (){

                      if(formKey.currentState!.validate())
                        {

                      ProfileCubit.get(context).chargeWallet(code: controller.text);}},
                    text:'Charge',
                    width: double.infinity,
                    height: 50,
                    radius: basicRadius,
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
