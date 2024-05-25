
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/generated/assets.dart';
import 'package:travanix/core/styles/app_colors.dart';

class TripItem extends StatelessWidget {
  const TripItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 1.5/2,
      child: PhysicalModel(
        color: greyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        elevation: 10,
        shadowColor: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage(
                        Assets.imagesEmail,

                      ),
                  ),


              ),



            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: MediaQuery.sizeOf(context).width*.045,

                backgroundColor: Colors.white,
                child: IconButton(
                  color: Colors.red,
                  icon:  Icon(FontAwesomeIcons.solidHeart,
                    size:MediaQuery.sizeOf(context).width*.045,

                  ),
                  onPressed: (){},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}