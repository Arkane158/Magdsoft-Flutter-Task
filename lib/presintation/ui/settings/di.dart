import 'package:magdsoftfluttertask/data/repository/help_repo_impl.dart';
import 'package:magdsoftfluttertask/domain/usecases/help_usecase.dart';

injectHelpUsecase() {
  return HelpUsecase(injectHelpRepository());
}
