
import 'package:flutter/cupertino.dart';

import '../../../core/styles/app_text_styles.dart';
import '../../../core/widgets/rating_bar.dart';
import '../view_model/review_cubit.dart';

class AwesomeDialogChild extends StatelessWidget {
  const AwesomeDialogChild({
    super.key,
    required this.cubit,
  });

  final ReviewCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Please put your rate',
          style: AppTextStyles.styleSemiBold20(context),
        ),
        const SizedBox(height: 10,),
        CustomRatingBar(
          ratingFunction: (rating)
          {
            cubit.rate=rating;

          },
          rating: cubit.rate,
        )
      ],
    );
  }
}