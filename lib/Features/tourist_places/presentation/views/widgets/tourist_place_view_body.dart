import 'package:flutter/material.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/tourist_place_info.dart';
import '../../../../../core/widgets/custom_decorated_container.dart';
import '../../../../../core/widgets/custom_draggable_scroll_sheet.dart';
import '../../../../restaurant/presentation/views/widgets/restaurant_page_view.dart';
class TouristPlacesViewBody extends StatelessWidget {
  const TouristPlacesViewBody({super.key, required this.model});
  final AttractionActivitiesModelData model;
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        const  RestaurantPageView(),
        CustomDraggableScrollSheet(
            initialChildSize: 0.56,
            minChildSize: 0.56,
            builder: (context,scrollController)
            {
              return   CustomDecoratedContainer(
                  scrollController:scrollController ,
                  borderRadius: 15,
                  child:  SliverToBoxAdapter(child: TouristPlaceInfo(model: model,)));
            })

      ],
    );
  }
}
