import 'package:magdsoftfluttertask/domain/datasource/otp_datasource_contract.dart';
import 'package:magdsoftfluttertask/data/api/api_manager.dart';
import 'package:magdsoftfluttertask/domain/model/otp_response.dart';

class OtpDataSourceImplementation implements OtpDataSourceContract {
  ApliManager apliManager;
  OtpDataSourceImplementation(this.apliManager);
  @override
  Future<OtpResponse?> otpRequest(String code, String phoneNumber) async {
    var response = await apliManager.otpRequest(code, phoneNumber);
    return response.toDomainOtpResponse();
  }
}

OtpDataSourceImplementation injectOtpDataSource() {
  return OtpDataSourceImplementation(ApliManager.getInstance());
}
