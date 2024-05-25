import 'package:expandable_page_view/expandable_page_view.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:travanix/Features/on_boarding/data/models.dart';
import 'package:travanix/Features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:travanix/core/generated/assets.dart';

import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

import 'package:travanix/core/utils/cache_service.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/core/widgets/custom_text_button.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  List<OnBoardingModel>item=[
    OnBoardingModel(title: 'DISCOVER NEW THINGS', image: Assets.imagesHotel, subTitle: 'Explore new things through our app.Discover initiary & other stuffs'),
    OnBoardingModel(title: 'SHARE YOUR MOMENTS', image: Assets.imagesMoment, subTitle: 'Share you trip initiary with others. Let''\'s hake the travel fun & enjoyable'),
    OnBoardingModel(title: 'Choose a Distination', image: Assets.imagesDestination, subTitle: 'Select a place for your trip easily and know the exact cost of the tour'),
  ];
  PageController controller=PageController();
  int pageIndex=0;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child:

          CustomScrollView(
            slivers: [

              SliverFillRemaining(
               hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,


                  children: [
                    ExpandablePageView(
                      controller:controller ,



                      //physics:const NeverScrollableScrollPhysics(),
                      onPageChanged: (index){

                        setState(() {
                          pageIndex=index;
                        });
                      },
                     children : List.generate(item.length, (index) =>  PageViewItem(
                       item: item[index],
                       pageIndex: pageIndex,
                       controller: controller,

                     ))

                    ),
                   const  Spacer(),

                    Row(
                      children: [
                        CustomTextButton(text: 'Skip',
                            onPressed: () async{
                              await setInCache(context);
                            },
                        textStyles:AppTextStyles.styleSemiBold16(context) ,),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child:  SizedBox(
                            height: 80,
                            width: 80,
                            child: CircularStepProgressIndicator(
                              totalSteps: 3,
                              selectedColor: basicColor,
                              currentStep: pageIndex+1,
                              width: 80,
                              height: 80,
                              child: FloatingActionButton(
                                onPressed: () async {
                                  if(pageIndex==2)
                                  {
                                   await setInCache(context);

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
                        ),
                      ],
                    )






                  ],
                ),
              ),

            ],

          ),




    );
  }

  Future<void> setInCache(BuildContext context) async {
     await CacheHelper.setInCacheHelper(value:true , key: 'onBoarding').then((value) {
      context.pushReplacement(AppRouter.loginScreen);
    } );
  }
}



