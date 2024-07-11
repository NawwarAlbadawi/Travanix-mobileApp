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


        if(state is GetReviewSuccess)
          {

            return ListView.builder(
              shrinkWrap: true,
              physics: const  NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=> ReviewItem(model: GetReviewCubit.get(context).model!.data![index]),
              itemCount: GetReviewCubit.get(context).model!.data!.length,
            );
          }
        else if(state is GetReviewFails)
          {
            return Text(state.error,style: AppTextStyles.styleSemiBold24(context),);
          }
        return const Center(child: CircularProgressIndicator(),);

      }
    );
  }
}
