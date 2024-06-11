import 'package:flutter/material.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class TripSteps extends StatefulWidget {
  const TripSteps({super.key});

  @override
  State<TripSteps> createState() => _TripStepsState();
}

class _TripStepsState extends State<TripSteps> {

  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.sizeOf(context).height*0.6,
      decoration:const  BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        ),
        color: navyBlueColor
      ),
      child: Stepper(
        currentStep: currentIndex,
        stepIconHeight: 45,
        stepIconWidth: 45,
        connectorThickness: 5,
        onStepTapped: (index)
        {
          currentIndex=index;
          setState(() {
      
          });
        },
        steps:List.generate(5,(index)=>
            Step(
              state: StepState.indexed,
           

            title:  Text('Step $index title',
            style: AppTextStyles.styleSemiBold18(context).copyWith(
              color: Colors.white
            ),),
            content: Container(
              alignment: Alignment.centerLeft,
              child:  Text('Content for Step $index',
                style: AppTextStyles.styleSemiBold20(context).copyWith(
                    color: Colors.white
                ),),

            ),
            stepStyle:  StepStyle(
                color: basicColor,
              indexStyle: AppTextStyles.styleBold18(context).copyWith(
                color: Colors.white
              )

               
            )
        ))
      ),
    );
  }
}
