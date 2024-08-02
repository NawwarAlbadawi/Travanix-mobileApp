import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_list.dart';


class HotelsViewBody extends StatelessWidget {
  const HotelsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // CustomSearchBar(padding: EdgeInsets.symmetric(horizontal: 20,)),
              SizedBox(height: 20,),




            ],
          ),
        ),
        HotelsList()
      ],

    );
  }
}






