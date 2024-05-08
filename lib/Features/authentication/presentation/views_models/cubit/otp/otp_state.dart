part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}
final class SendOTPError extends OtpState{

}
final class SendOTPSuccess extends OtpState{

}

final class VerifyOTPSuccess extends OtpState{

}