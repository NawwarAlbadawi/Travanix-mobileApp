import 'package:flutter/material.dart';
import 'package:travanix/Features/search/presentation/views/widgets/search_bar_section.dart';
import 'package:travanix/Features/search/presentation/views/widgets/search_categories_list.dart';
import 'package:travanix/Features/search/presentation/views/widgets/search_list.dart';

class  SearchViewBody extends StatefulWidget {
   const  SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  List<String> tags = [];

  List<String> options = [
    'Address', 'Entertainment', 'Politics',
    'Automotive', 'Sports', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];





  double value=0;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:Column(
              children: [
                  SearchBarSection(),
                 SearchCategoriesList(),
                 SizedBox(height: 30,),
                // ChipsChoice<String>.multiple(
                //     choiceCheckmark: true,
                //
                //     choiceStyle: C2ChipStyle(
                //       overlayColor: basicColor,
                //       avatarBackgroundColor: basicColor,
                //       avatarForegroundColor: basicColor,
                //       foregroundStyle: AppTextStyles.styleMedium16(context),
                //       checkmarkColor: basicColor,
                //       borderRadius: BorderRadius.circular(basicRadius),
                //       backgroundColor: basicColor,
                //       checkmarkStyle: C2ChipCheckmarkStyle.sharp,
                //
                //
                //
                //
                //
                //     ),
                //
                //     value: tags,
                //     wrapped: true,
                //
                //
                //     onChanged: (val) => setState(() => tags = val),
                //     choiceItems: C2Choice.listFrom<String, String>(
                //       source: options,
                //       value: (i, v) => v,
                //       label: (i, v) => v,
                //     )),
              ],
            ) ,),
          SearchList()
        ],

      ),
    );
  }
}
