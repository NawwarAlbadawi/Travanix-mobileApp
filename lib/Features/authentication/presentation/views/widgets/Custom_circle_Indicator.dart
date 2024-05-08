import 'package:custom_indicator/custom_indicator.dart';
import 'package:flutter/material.dart';
class  CircleIndicator extends StatefulWidget {
  const CircleIndicator({super.key});

  @override
  State<CircleIndicator> createState() => _CustomCircleIndicatorState();
}

class _CustomCircleIndicatorState extends State<CircleIndicator> with SingleTickerProviderStateMixin {
  int value=0;
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync:this,
        duration: const Duration(seconds: 10));
    animation=Tween<double>(
        begin: 0,
        end: 100
    ).animate(animationController);
    super.initState();
  }
  @override
   void dispose() {
    // TODO: implement dispose

    animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation:animationController ,

        builder: (context,widget) {

          if(animation.value==100)
          {

            animationController.reverse();
          }
          else if(animation.value==0)
          {
            animationController.forward();
          }

          return  Center(child:
          CustomCircleIndicator(
            value: animation.value,
            backColor: Colors.red,
            size: 50,
            showValue: false,
            checkOnFinish: false,
          ),);
        }
    );
  }
}
