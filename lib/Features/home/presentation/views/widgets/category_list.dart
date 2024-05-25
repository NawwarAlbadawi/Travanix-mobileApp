import 'package:flutter/material.dart';
import 'package:travanix/Features/home/presentation/views/widgets/category_item.dart';
class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:MediaQuery.sizeOf(context).height*.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=>const Padding(
          padding:  EdgeInsets.only(right: 10.0),
          child:  CategoryItem(),
        ),
        itemCount: 20,
      ),);
  }
}