import 'package:flutter/material.dart';
import 'package:travanix/Features/Review/widgets/review_item.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const  NeverScrollableScrollPhysics(),

      itemBuilder: (context,index)=>const ReviewItem(),
      itemCount: 10,


    );
  }
}
