import 'package:magdsoftfluttertask/domain/model/login_response.dart';
import 'package:magdsoftfluttertask/domain/repository/login_repo_contract.dart';

class LoginUsecase {
  LoginRepositoryContract repository;
  LoginUsecase(this.repository);
  Future<LoginResponse?> invoke(String name, String phone) async {
    return await repository.login(name, phone);
  }
}
