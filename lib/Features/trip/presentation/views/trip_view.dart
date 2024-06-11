import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_view_body.dart';
class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            GoRouter.of(context).pop();
          },
        ),
      ),
      body:const  TripViewBody(

      ),
    );
  }
}
