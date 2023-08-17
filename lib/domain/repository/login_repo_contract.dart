
import 'package:magdsoftfluttertask/domain/model/login_response.dart';

abstract class LoginRepositoryContract {
  Future<LoginResponse?>  login(String name, String phone);
}
