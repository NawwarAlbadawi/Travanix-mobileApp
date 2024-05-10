
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';

class OTPItem extends StatelessWidget {
  const OTPItem({super.key, required this.controller, required this.index});
  final TextEditingController controller ;
  final int index;

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: Padding(
        padding:const EdgeInsets.only(right: 5),
        child: SizedBox(
          height: 68,
          width: 68,
          child: TextFormField(
            decoration: InputDecoration(
                focusColor: basicColor,
                hoverColor: basicColor,
                fillColor: basicColor,


                border: buildOutlineInputBorder(),
                focusedBorder:buildOutlineInputBorder() ,
                hintText: '0',
                hintStyle: AppTextStyles.styleMedium18(context).copyWith(
                    color: greyColor
                )


            ),

            textAlign: TextAlign.center,

            controller:controller ,
            textInputAction: TextInputAction.next,
            style: AppTextStyles.styleMedium18(context),
            keyboardType: TextInputType.number,
            onChanged: (value)
            {
              if(value.length==1)
              {

                if(index!=4)
                {
                  FocusScope.of(context).nextFocus();}
                }
              else
                {
                  FocusScope.of(context).previousFocus();
                }
            },
            maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
            textAlignVertical: TextAlignVertical.top,
            autofocus: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),

            ],


          ),
        ),
      ),
    );
  }
}
OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:const BorderSide(
          color: basicColor
      )
  );
}