import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/rating_bar.dart';
import 'package:travanix/constants.dart';
class HotelsItemBar extends StatelessWidget {
  const HotelsItemBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(basicRadius),
                color: Colors.white.withOpacity(0.3),
              ),
              padding:const  EdgeInsets.all(8),
              child:const  CustomRating(
                color: Colors.yellow,
              )),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(basicRadius),
              color: Colors.white.withOpacity(0.3),
            ),

            child: IconButton(
              color: Colors.red,
              icon: const  Icon(IconlyBold.heart),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
