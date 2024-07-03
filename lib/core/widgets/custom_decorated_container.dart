import 'package:flutter/material.dart';

import '../../constants.dart';
class CustomDecoratedContainer extends StatelessWidget {
  const CustomDecoratedContainer({super.key, this.borderRadius, required this.child, required this.scrollController});
  final double?borderRadius;
  final Widget child;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      decoration:   BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.only(
            topLeft:Radius.circular( borderRadius?? 25),
            topRight: Radius.circular(borderRadius?? 25),

          ),
          boxShadow: [
            BoxShadow(
              blurRadius: basicRadius,

            )
          ]

      ),
      child:
      CustomScrollView(
        controller: scrollController,
        slivers: [
            child
        ],
      ) ,
    );
  }
}
