

import 'package:email_otp/email_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  static OtpCubit get(context)=>BlocProvider.of(context);
  EmailOTP myAuth = EmailOTP();

  Future<void> sendOtp({required String email}) async {
    EmailOTP.config(
        appEmail: "nowar200342@gmail.com",
        appName: "Travanix",
        otpLength: 5,
        otpType: OTPType.numeric,
        emailTheme: EmailTheme.v1
    );


 if( await  EmailOTP.sendOTP(email: email)==true)
   {

     emit(SendOTPSuccess());
   }
  }
  void verifyOTP({required String otp})async
  {
  if(await EmailOTP.verifyOTP (otp: otp))
    {

      emit(VerifyOTPSuccess());
    }
  else
    {
      emit(VerifyOTPError());
    }
  }
}
