import 'package:magdsoftfluttertask/domain/model/otp_response.dart';

abstract class OtpRepositoryContract {
    Future<OtpResponse?> otpRequest(String code, String phoneNumber);

}