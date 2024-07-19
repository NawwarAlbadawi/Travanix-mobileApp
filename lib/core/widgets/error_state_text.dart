
import 'package:flutter/cupertino.dart';

import '../styles/app_text_styles.dart';

class ErrorStateText extends StatelessWidget {
  const ErrorStateText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,style: AppTextStyles.styleSemiBold24(context),),
    );
  }
}