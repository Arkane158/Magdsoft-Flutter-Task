import 'package:magdsoftfluttertask/domain/model/help.dart';
import 'package:magdsoftfluttertask/domain/repository/help_repo_contract.dart';

class HelpUsecase {
  HelpRepositoryContract repository;
  HelpUsecase(this.repository);
  Future<List<Help>?> invoke() async {
    return await repository.getHelp();
  }
}
