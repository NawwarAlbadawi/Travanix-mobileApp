import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:travanix/Features/on_boarding/data/models.dart';
import 'package:travanix/Features/on_boarding/widgets/on_boarding_body.dart';
import 'package:travanix/Features/on_boarding/widgets/page_view_item.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';
class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  List<OnBoardingModel>item=[
    OnBoardingModel(title: 'DISCOVER NEW THINGS', image: Assets.imagesBestPlace, subTitle: 'Explore new things through our app.Discover initiary & other stuffs'),
    OnBoardingModel(title: 'SHARE YOUR MOMENTS', image: Assets.imagesMap, subTitle: 'Share you trip initiary with others. Let''\'s hake the travel fun & enjoyable'),
    OnBoardingModel(title: 'Choose a Distination', image: Assets.imagesDestination, subTitle: 'Select a place for your trip easily and know the exact cost of the tour'),
  ];
  PageController controller=PageController();
  int pageIndex=0;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(


        children: [
          Expanded(
            child: PageView.builder(
              controller:controller ,
              physics:const BouncingScrollPhysics(),
              onPageChanged: (index){

                setState(() {
                  pageIndex=index;
                });
              },
              itemCount: item.length,
                itemBuilder:
            (context,index)
            {
              return  PageViewItem(
              item: item[index]
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CircularStepProgressIndicator(
              totalSteps: 3,
             selectedColor: basicColor,
              currentStep: pageIndex+1,
              width: 80,
              height: 80,
              child: FloatingActionButton(
                onPressed: (){
                  if(pageIndex==2)
                    {
                      GoRouter.of(context).pushReplacement(AppRouter.loginScreen);
                    }
                  else
                    {
                  controller.nextPage(duration:const Duration(
                    milliseconds: 100
                  ), curve: Curves.easeInOutCirc);}
                },
                shape:const  OvalBorder(),
                backgroundColor: Colors.transparent,
                foregroundColor:Colors.transparent ,
                elevation: 0,

                child:const Icon(
                  Icons.arrow_forward_ios,
                  color: navyBlueColor,
                  size: 30,
                ),
              ),

            ),
          ),
        const  SizedBox(
            height: 5,
          )


        ],
      ),
    );
  }
}



