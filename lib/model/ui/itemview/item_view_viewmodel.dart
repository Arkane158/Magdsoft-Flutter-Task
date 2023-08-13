import 'package:flutter_bloc/flutter_bloc.dart';

enum TabSelection { overview, spesification, review }

class TabSelectionCubit extends Cubit<TabSelection> {
  TabSelectionCubit() : super(TabSelection.overview);

  void selectTab(TabSelection tab) => emit(tab);
}
