import 'package:magdsoftfluttertask/domain/model/otp_response.dart';
import 'package:magdsoftfluttertask/domain/repository/otp_repo_contract.dart';

class OtpUsecase {
  OtpRepositoryContract repository;
  OtpUsecase(this.repository);
  Future<OtpResponse?> invoke(String phoneNumber, String code) async {
    return await repository.otpRequest(phoneNumber, code);
  }
}
