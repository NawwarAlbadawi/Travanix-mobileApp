import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travanix/Features/Review/data/repositories/review_repo.dart';
import 'package:travanix/Features/Review/view_model/review_cubit.dart';
import 'package:travanix/Features/Review/widgets/review_list.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/rating_bar.dart';
class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key, required this.category, required this.id});

  final String category;
  final int id ;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    double rate =0 ;

    return  BlocProvider(
      create: (context)=>ReviewCubit(ReviewRepo()),
      child: BlocConsumer<ReviewCubit,ReviewState>(
        listener: (context,state){

          if(state is PostCommentSuccess)
            {

               buildAwesomeDialog(context:  context,
               child: Column(
                 children: [
                   Text(
                     'Please put your rate',
                     style: AppTextStyles.styleSemiBold20(context),
                   ),
                   const SizedBox(height: 10,),
                   CustomRatingBar(
                     ratingFunction: (rating)
                     {
                       rate=rating;

                     },
                     rating: rate,
                   )
                 ],
               )).show();

            }},
        builder:(context,state) {

          return Column(
            children: [
              TextField(
                controller: controller,
                cursorColor: navyBlueColor,
                decoration: InputDecoration(
                    focusedBorder:const  UnderlineInputBorder(
                        borderSide: BorderSide(color: basicColor)
                    ) ,
                    suffixIcon: IconButton(
                      icon: const   Icon(Icons.send_outlined,
                        color: basicColor,),
                      onPressed: (){
                        ReviewCubit.get(context).postComment(category: category, id: id,
                            comment: controller.text);
                      },
                    ),

                    hintText: 'Enter your review'),

              ),
              const SizedBox(height: 30,),
              const  ReviewList()


            ],
          );
        },

      ),
    );
  }

  AwesomeDialog buildAwesomeDialog({required BuildContext context,
   required Widget child}) {

    return AwesomeDialog(
               headerAnimationLoop: false,

              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.noHeader,
              body:  Center(child: child,),
              title: 'This is Ignored',
              desc:   'This is also Ignored',
              btnOkColor: basicColor,
              btnOkOnPress: () {

              },
            );
  }
}
