import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_info.dart';
import 'package:travanix/Features/restaurant/presentation/views/widgets/restaurant_page_view.dart';
import 'package:travanix/core/widgets/custom_decorated_container.dart';
import 'package:travanix/core/widgets/custom_draggable_scroll_sheet.dart';

class RestaurantViewBody extends StatelessWidget {
  const RestaurantViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
       const  RestaurantPageView(),
        CustomDraggableScrollSheet(
          initialChildSize: 0.56,
            minChildSize: 0.56,
            builder: (context,scrollController)
        {
         return   CustomDecoratedContainer(
           scrollController:scrollController ,
             borderRadius: 20,
             child:const  SliverToBoxAdapter(child: RestaurantInfo()));
        })

      ],
    );
  }
}

