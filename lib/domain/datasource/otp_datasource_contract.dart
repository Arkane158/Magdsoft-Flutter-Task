import 'package:magdsoftfluttertask/domain/model/otp_response.dart';

abstract class OtpDataSourceContract {
  Future<OtpResponse?> otpRequest(String code, String phoneNumber);
}
