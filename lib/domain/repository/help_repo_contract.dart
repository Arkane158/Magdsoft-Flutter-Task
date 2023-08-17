import 'package:magdsoftfluttertask/domain/model/help.dart';

abstract class HelpRepositoryContract {
  Future<List<Help>?> getHelp();
}
