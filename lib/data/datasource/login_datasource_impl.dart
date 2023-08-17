import 'package:magdsoftfluttertask/domain/datasource/login_datasource_contract.dart';
import 'package:magdsoftfluttertask/data/api/api_manager.dart';
import 'package:magdsoftfluttertask/domain/model/login_response.dart';

class LoginDataSourceImplentation implements LoginDataSourceContract {
  ApliManager apliManager;
  LoginDataSourceImplentation(this.apliManager);
  @override
  Future<LoginResponse?> login(String name, String phone) async {
    var response = await apliManager.loginRequest(name, phone);
   return response.toDomainLoginResponse();
     
  }
}

LoginDataSourceImplentation injectLoginDataSource() {
  return LoginDataSourceImplentation(ApliManager.getInstance());
}
