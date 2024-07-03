import 'package:flutter/material.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_info_body.dart';
import '../../../../../core/widgets/custom_decorated_container.dart';
import '../../../../../core/widgets/custom_draggable_scroll_sheet.dart';
import '../../../data/models/hotel_data_model.dart';


class HotelInfo extends StatelessWidget {
  const HotelInfo({super.key, required this.hotelData});
  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return  CustomDraggableScrollSheet(builder: (context,scrollController){
      return CustomDecoratedContainer(
        scrollController: scrollController,
          child: SliverToBoxAdapter(
        child: HotelInfoBody(
            hotelData: hotelData
        ),
      ));
    });
  }
}



