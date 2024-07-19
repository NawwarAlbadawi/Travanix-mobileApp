import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/Review/data/repositories/review_repo.dart';
import 'package:travanix/Features/Review/view_model/get_review_cubit.dart';
import 'package:travanix/Features/Review/view_model/review_cubit.dart';
import 'package:travanix/Features/Review/widgets/awesome_dialog_child.dart';
import 'package:travanix/Features/Review/widgets/review_list.dart';
import 'package:travanix/core/styles/app_colors.dart';
import '../../core/functions/buildInputDecoration.dart';
class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key, required this.category, required this.id});

  final String category;
  final int id ;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    return  MultiBlocProvider(
      providers: [
         BlocProvider(create:(context)=>ReviewCubit(ReviewRepo())),
        BlocProvider(create:(context)=>GetReviewCubit()..getReview(category: category, id: id)),
      ],
      
      child: BlocConsumer<ReviewCubit,ReviewState>(

          listener: (context,state){
    var cubit=ReviewCubit.get(context);

    if(state is PostCommentSuccess)
    {

    AwesomeDialog(
    headerAnimationLoop: false,

    context: context,
    animType: AnimType.scale,

    dialogType: DialogType.noHeader,
    body:  Center(child: AwesomeDialogChild(cubit: cubit),),
    title: 'This is Ignored',
    desc:   'This is also Ignored',
    btnOkColor: basicColor,
    btnOkOnPress: () {
    cubit.postRate(category: category, id: id,);

    },
    ).show();

    }
    if(state is PostRatingSuccess)
      {
       GetReviewCubit.get(context).getReview(category: category, id: id);
       controller.clear();
      }



    },
          builder:(context,state) {
            return Column(
              children: [
                TextField(
                  controller: controller,
                  cursorColor: navyBlueColor,

                  decoration: buildInputDecoration(context, controller,(){

                      ReviewCubit.get(context).postComment(category: category, id: id,
                          comment: controller.text);

                  }),

                ),
                const SizedBox(height: 20,),
                ReviewList(category: category,id: id),
              ],
            );
          }



      ),
    );
  }




}


