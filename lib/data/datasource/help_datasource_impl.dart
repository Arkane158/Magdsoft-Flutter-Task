import 'package:magdsoftfluttertask/domain/datasource/help_datasource_contract.dart';
import 'package:magdsoftfluttertask/data/api/api_manager.dart';
import 'package:magdsoftfluttertask/domain/model/help.dart';

class HelpDataSourceImplemintation implements HelpDataSourceContract {
  ApliManager apliManager;
  HelpDataSourceImplemintation(this.apliManager);

  @override
  Future<List<Help>?> getHelp() async {
    var respone = await apliManager.getHelp();
    return respone.help?.map((helpDTO) => helpDTO.toDomainHelp()).toList();
  }
}

HelpDataSourceImplemintation injectHelpDataSource() {
  return HelpDataSourceImplemintation(ApliManager.getInstance());
}
