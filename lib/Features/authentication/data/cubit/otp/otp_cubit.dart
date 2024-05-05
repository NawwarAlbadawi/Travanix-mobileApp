import 'package:bloc/bloc.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  static OtpCubit get(context)=>BlocProvider.of(context);
  EmailOTP myAuth = EmailOTP();

  void sendOtp({required String email}) async {
    myAuth.setConfig(
        appEmail: "nowar200342@gmail.com",
        appName: "Travanix",
        userEmail: email,
        otpLength: 5,
        otpType: OTPType.digitsOnly
    );

 if( await  myAuth.sendOTP()==true)
   {
     print('hjgjg');
     emit(SendOTPSuccess());
   }





  }
  void verifyOTP({required String otp})async
  {
  if(await myAuth.verifyOTP(otp: otp))
    {
      emit(VerifyOTPSuccess());
    }
  }
}
