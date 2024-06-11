import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/Review/review_body.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/rating_bar.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_services_list.dart';
import 'package:travanix/Features/map/presentation/views/wiggets/map_view_body.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_text_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class HotelInfoBody extends StatelessWidget {
  const HotelInfoBody({super.key, required this.hotelData});
  final HotelData hotelData;
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Container(
              height: 5,
              width: MediaQuery.sizeOf(context).width*.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: navyBlueColor
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(hotelData.cityName,style: AppTextStyles.styleBold18(context),),
          Text(hotelData.hotelName,
            style: AppTextStyles.styleBold35(context),),
          const SizedBox(height: 10,),
          CustomRating(rating: hotelData.hotelClass,),
          const SizedBox(height: 20,),
          Text(hotelData.simpleDescriptionAboutHotel,
            style: AppTextStyles.styleMedium16(context),),
          const SizedBox(height: 20,),
          HotelServicesList(
            services: hotelData.services,
          ),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).pushNamed('mapView',
              queryParameters: {
                'x':hotelData.coordinateX.toString(),
                'y':hotelData.coordinateY.toString()},
              extra: hotelData);
            },
            child:   AspectRatio(
              aspectRatio: 3,
              child: Container(
                height: MediaQuery.sizeOf(context).height*.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: greyColor,

                    ),
                    boxShadow: [
                      BoxShadow(
                          color: navyBlueColor.withOpacity(0.4),
                          offset: const Offset(0,2),
                          blurStyle: BlurStyle.normal,
                          blurRadius: 15
                      )
                    ]

                ),
                width: double.infinity,

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:  IgnorePointer(
                        ignoring: true,
                        child:  MapViewBody(controller: MapController(),
                        latitude: hotelData.coordinateX,longitude: hotelData.coordinateY,))),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Text('Tel : ',style: AppTextStyles.styleSemiBold16(context).copyWith(
                color: basicColor,


              ),

              ),
              CustomTextButton(text: hotelData.phoneNumber,
                  onPressed: () async{
              
                if(await canLaunchUrlString('tel:${hotelData.phoneNumber}'))
                  {
                    await launchUrl(Uri.parse('tel:${hotelData.phoneNumber}'));
              
                  }
                launchUrl(Uri.parse( hotelData.phoneNumber));
              
              },
                textStyles:AppTextStyles.styleSemiBold16(context) .copyWith(
                    decoration: TextDecoration.underline
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Text('Reviews',style: AppTextStyles.styleSemiBold24(context),),
           ReviewBody(
            category: 'hotel_id',
            id: hotelData.id,
          )
        ],
      ),




    );
  }


}




