import 'package:magdsoftfluttertask/data/datasource/help_datasource_impl.dart';
import 'package:magdsoftfluttertask/domain/repository/help_repo_contract.dart';

import '../../domain/model/help.dart';

class HelpRepositoryImplementation implements HelpRepositoryContract {
  HelpDataSourceImplemintation helpDataSourceImplemintation;
  HelpRepositoryImplementation(this.helpDataSourceImplemintation);

  @override
  Future<List<Help>?> getHelp() {
    return helpDataSourceImplemintation.getHelp();
  }
}

HelpRepositoryContract injectHelpRepository() {
  return HelpRepositoryImplementation(injectHelpDataSource());
}
