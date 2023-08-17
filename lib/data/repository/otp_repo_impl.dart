import 'package:magdsoftfluttertask/data/datasource/otp_datasource_impl.dart';
import 'package:magdsoftfluttertask/domain/model/otp_response.dart';
import 'package:magdsoftfluttertask/domain/repository/otp_repo_contract.dart';

class OtpRepositoryImplementation implements OtpRepositoryContract {
  OtpDataSourceImplementation otpDataSourceImplementation;
  OtpRepositoryImplementation(this.otpDataSourceImplementation);

  @override
  Future<OtpResponse?> otpRequest(String code, String phoneNumber) {
    return otpDataSourceImplementation.otpRequest(code, phoneNumber);
  }
}

OtpRepositoryContract injectOtpRepository() {
  return OtpRepositoryImplementation(injectOtpDataSource());
}
