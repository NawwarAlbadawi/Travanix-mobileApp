import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travanix/Features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_item.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotels_list.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

class HotelsViewBody extends StatelessWidget {
  const HotelsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding:  EdgeInsets.all(20.0),
      child:  SingleChildScrollView(
        child: Column(
          children: [

            CustomSearchBar(),
            HotelSList()
        
        
        
          ],
        ),
      ),
    );
  }
}






