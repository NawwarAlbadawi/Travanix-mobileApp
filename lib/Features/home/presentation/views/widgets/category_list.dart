import 'package:flutter/material.dart';
import 'package:travanix/Features/home/presentation/views/widgets/category_item.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';

import '../../../data/models/home_category_model.dart';
class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<HomeCategoryModel> list =const  [
    HomeCategoryModel(categoryName: 'Hotels', categoryRoute: AppRouter.hotelsView,image: Assets.imagesHotels),
    HomeCategoryModel(categoryName: 'Restaurants', categoryRoute: AppRouter.allRestaurantView,image: Assets.imagesRestaurants),
    HomeCategoryModel(categoryName: 'Tourist Places', categoryRoute: AppRouter.allTouristPlacesView,image: Assets.imagesTouristPlaces)
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:MediaQuery.sizeOf(context).height*.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=> Padding(
          padding: const  EdgeInsets.only(right: 10.0),
          child:  CategoryItem(model: list[index],),
        ),
        itemCount: list.length,
      ),);
  }
}