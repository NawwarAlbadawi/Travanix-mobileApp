import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travanix/Features/home/presentation/views/widgets/category_item.dart';
import 'package:travanix/Features/home/presentation/views/widgets/category_list.dart';

import 'package:travanix/Features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:travanix/Features/home/presentation/views/widgets/home_view_body.dart';

import 'package:travanix/core/styles/app_text_styles.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>  {
  @override

  // default constructor


  void initState() {
    // TODO: implement initState
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 90.0,
        left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // const SizedBox(height: 90,),
            Text('Explore and Find ',
           style: AppTextStyles.styleMedium24(context),),
            const SizedBox(height: 5,),
            Text('Your Best Journey ',
              style: AppTextStyles.styleSemiBold24(context),),
            const SizedBox(height: 20,),
            const CustomSearchBar(),
            const SizedBox(height: 30,),
            Text('Category',style: AppTextStyles.styleBold18(context),),
            const SizedBox(height: 10,),
            const CategoryList(),

      
      
      
        ],
        ),
      ),
    );
  }


}








