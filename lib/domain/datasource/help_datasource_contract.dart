import 'package:magdsoftfluttertask/domain/model/help.dart';

abstract class HelpDataSourceContract {
    Future<List<Help>?> getHelp();

}