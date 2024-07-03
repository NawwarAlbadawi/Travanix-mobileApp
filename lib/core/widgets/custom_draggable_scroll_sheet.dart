  import 'package:flutter/material.dart';

  class CustomDraggableScrollSheet extends StatelessWidget {
    const CustomDraggableScrollSheet({super.key, required this.builder, this.initialChildSize, this.maxChildSize, this.minChildSize,});
    final double ? initialChildSize;
    final double ? maxChildSize ;
    final double?   minChildSize;


    final Widget Function (BuildContext context,ScrollController scrollController) builder;

    @override
    Widget build(BuildContext context) {
      return  DraggableScrollableSheet(
          initialChildSize:initialChildSize??  0.56,
          expand: true,
          maxChildSize:maxChildSize?? 0.8,
          minChildSize:minChildSize?? 0.36,
          builder:builder);
    }
  }
