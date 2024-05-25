import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:travanix/Features/home/presentation/views/widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {


    return  const Scaffold(
      body: HomeViewBody(),
    );

  }
}
