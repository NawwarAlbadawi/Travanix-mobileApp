import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late Animation<Offset> sliderAnimation;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    InitAnimation();
    GoRouter.of(context).push(AppRouter.splashView);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void InitAnimation() {
     controller=AnimationController(
      vsync: this,
    duration:const  Duration(
      seconds: 1
    ),

    );
    sliderAnimation=Tween<Offset>(
      begin: const Offset(0, 6),
      end:const Offset(0, -1),

    ).animate(CurvedAnimation(parent: controller,
        curve: Curves.easeOut));
    controller.forward();
  }
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Image(image:
          AssetImage(Assets.imagesSplashViewImage)),
          AnimatedBuilder(
            animation: controller,

            builder: (context,widget)
            {
              return SlideTransition(

                position: sliderAnimation,


                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal:90.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text('Travanix',
                        style: AppTextStyles.styleSemiBold20(context).copyWith(

                        ),
                        textAlign: TextAlign.center,

                      ),
                    ),
                  ),
                );
            },

          )

        ],
      ),
    );
  }
}
