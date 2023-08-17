import 'package:magdsoftfluttertask/data/repository/login_repo_impl.dart';
import 'package:magdsoftfluttertask/domain/usecases/login_usecase.dart';

LoginUsecase injectLoginUseCase() {
  return LoginUsecase(injectLoginRepository());
}
