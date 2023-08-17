import 'package:magdsoftfluttertask/data/datasource/login_datasource_impl.dart';
import 'package:magdsoftfluttertask/domain/datasource/login_datasource_contract.dart';
import 'package:magdsoftfluttertask/domain/model/login_response.dart';
import 'package:magdsoftfluttertask/domain/repository/login_repo_contract.dart';

class LoginRepositoryImplemintation extends LoginRepositoryContract {
  LoginDataSourceContract loginDataSource;
  LoginRepositoryImplemintation(this.loginDataSource);
  @override
  Future <LoginResponse?>login(String name, String phone) {
    return loginDataSource.login(name, phone);
  }
}

LoginRepositoryContract injectLoginRepository() {
  return LoginRepositoryImplemintation(injectLoginDataSource());
}
