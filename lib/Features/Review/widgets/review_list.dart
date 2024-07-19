import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/Review/view_model/get_review_cubit.dart';
import 'package:travanix/Features/Review/widgets/review_item.dart';
import 'package:travanix/core/styles/app_text_styles.dart';


class ReviewList extends StatelessWidget {
  const ReviewList({super.key, required this.category, required this.id});
  final String category;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReviewCubit,GetReviewState>(

      builder: (context,state) {
        var cubit=GetReviewCubit.get(context);
        if(state is GetReviewLoading)
          {
            return const Center(child: CircularProgressIndicator(),);

          }
        else if(state is GetReviewFails)
          {
            return Text(state.error,style: AppTextStyles.styleSemiBold24(context),);
          }
        return cubit.model!.data!.isEmpty?Text('Be the first one who put the comment',style: AppTextStyles.styleSemiBold20(context).copyWith(

        ),) :
          ListView.builder(
          shrinkWrap: true,
          physics: const  NeverScrollableScrollPhysics(),
          itemBuilder: (context,index)=> ReviewItem(model: cubit.model!.data![index],category: category,),
          itemCount: cubit.model!.data!.length,
        );

      }
    );
  }
}
