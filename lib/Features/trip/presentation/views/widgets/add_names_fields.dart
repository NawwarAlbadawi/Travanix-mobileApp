import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/Features/profile/presentation/views_model/profile_cubit.dart';
import 'package:travanix/Features/trip/data/model/BookTripModel.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/book_trip_cubit/book_trip_cubit.dart';
import 'package:travanix/constants.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_material_button.dart';
import 'package:travanix/core/widgets/custom_text_form_field.dart';
class AddNamesFields extends StatelessWidget {
  const AddNamesFields({super.key, required this.model});

  final TripsModelData model;

  @override
  Widget build(BuildContext context) {
    List<TextEditingController>nameControllers=[];
    List<TextEditingController>ageControllers=[];
    GlobalKey<FormState>formKey=GlobalKey<FormState>();
    var cubit2=ProfileCubit.get(context);
    final TextEditingController phoneController=TextEditingController();
    return BlocBuilder<ProfileCubit,ProfileState>(
        builder:(context,state) {
          if (cubit2.profileModel == null) {
            return const Center(child: CircularProgressIndicator(),);
          }
          else {
            return BlocBuilder<BookTripCubit, BookTripState>(
                builder: (context, state) {
                  var cubit = BookTripCubit.get(context);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 50),
                    child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                              children: [

                                CustomTextFormField(
                                    controller:phoneController,prefix: const  Icon(Icons.phone_android),
                                radius: basicRadius,
                                hintText: 'Add phone number',
                                validator: (value){
                                      if(value!.isEmpty)
                                        {
                                          return 'Required field';
                                        }
                                      return null;
                                },),
                                const SizedBox(height: 15,),
                                ListView.builder(
                                    itemCount: cubit.personCount,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      nameControllers.add(
                                          TextEditingController());
                                      ageControllers.add(
                                          TextEditingController());
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: CustomTextFormField(
                                                  prefix: const Icon(Icons
                                                      .drive_file_rename_outline),
                                                  controller: nameControllers[index],
                                                  hintText: 'Enter the name',
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Required field';
                                                    }
                                                    return null;
                                                  },
                                                )),
                                            const SizedBox(width: 5,),
                                            Expanded(child: CustomTextFormField(
                                              controller: ageControllers[index],
                                              labelText: 'Age',
                                              textInputType: TextInputType
                                                  .number,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Required field';
                                                }
                                                return null;
                                              },
                                              textInputFormatter: [
                                                LengthLimitingTextInputFormatter(
                                                    2),
                                              ],
                                            )),
                                          ],
                                        ),
                                      );
                                    }),
                                const SizedBox(height: 20,),
                                CustomMaterialButton(
                                  radius: 20,
                                  width: double.infinity,
                                  color: cubit.personCount*model.priceTrip!>cubit2.profileModel!.wallet!?basicColor.withOpacity(0.2):basicColor,
                                  onPressed: cubit.personCount*model.priceTrip!>cubit2.profileModel!.wallet!?(){}: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.bookTrip(
                                          tripId: model.id!,
                                          phoneNumber: phoneController.text,
                                          paymentMethod: 'wallet',
                                          details: List.generate(
                                              cubit.personCount, (i) => Details(
                                                  name: nameControllers[i].text,
                                                  age: int.tryParse(
                                                      ageControllers[i].text)
                                              )))
                                      ;
                                    }
                                  },
                                  text: 'Book',
                                  height: 50,),
                                cubit.personCount*model.priceTrip!>cubit2.profileModel!.wallet!?Text('Please charge your wallet  to be able to book',style: AppTextStyles.styleMedium18(context),):const SizedBox()

                              ]
                          ),
                        )),
                  );
                }
            );
          }
        });


    }
}

