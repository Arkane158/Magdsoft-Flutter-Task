
import 'package:magdsoftfluttertask/domain/model/login_response.dart';

abstract class LoginDataSourceContract {
  Future <LoginResponse?> login(String name, String phone);
}
