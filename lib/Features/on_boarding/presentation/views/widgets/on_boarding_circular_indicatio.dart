import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/utils/cache_service.dart';
import '../../../../../core/utils/routers.dart';
class OnBoardingCircularIndicator extends StatelessWidget {
  const OnBoardingCircularIndicator({super.key, required this.pageIndex, required this.controller});
  final int pageIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomRight,
      child:  SizedBox(
        height: 80,
        width: 80,
        child: CircularStepProgressIndicator(
          totalSteps: 3,
          selectedColor: basicColor,
          currentStep: pageIndex+1,
          roundedCap: (_, __) => true,
          padding: 0,
          width: 150,
          height: 150,
          child: FloatingActionButton(
            onPressed: () async {
              if(pageIndex==2)
              {
                await setInCache(context);
              }
              else
              {
                controller.nextPage(
                    duration:const Duration(
                    milliseconds: 100
                ), curve: Curves.easeInOut);}
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
    );
  }
}

Future<void> setInCache(BuildContext context) async {
  await CacheHelper.setInCacheHelper(value:true , key: 'onBoarding').then((value) {
    GoRouter.of(context).pushReplacement(AppRouter.loginScreen);
  } );
}