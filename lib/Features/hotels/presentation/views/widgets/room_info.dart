
import 'package:flutter/material.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/room_info_body.dart';

class RoomInfo extends StatelessWidget {
  const RoomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
      initialChildSize: 0.3,
      expand: true,
      maxChildSize: 0.6,


        builder:(context,scroll)=> Container(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              decoration: const  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(25),
                    topRight: Radius.circular(25),
                  )

              ),
              child: CustomScrollView(
                controller: scroll,
                slivers: const  [
                  SliverToBoxAdapter(
                    child: RoomInfoBody(),
                  ),
            
                ],
              ),
            ));
  }
}



