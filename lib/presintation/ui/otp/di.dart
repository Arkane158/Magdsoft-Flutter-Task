import 'package:magdsoftfluttertask/data/repository/otp_repo_impl.dart';
import 'package:magdsoftfluttertask/domain/usecases/otp_usecase.dart';

injectOtpUsecase() {
  return OtpUsecase(injectOtpRepository());
}
