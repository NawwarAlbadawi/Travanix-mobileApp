import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/search/data/Repositories/search_for_hotel_repo.dart';
import 'package:travanix/Features/search/presentation/views_models/search_for_hotel_cubit/search_for_hotel_cubit.dart';

import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.searchBody});
  final Widget searchBody;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
       leading:const  BackRowIcon(),
       title: Text('Search',style: AppTextStyles.styleSemiBold24(context),),
     ),
      body:  searchBody,
      resizeToAvoidBottomInset: false,
    );
  }
}
