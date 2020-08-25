import 'package:bloc/bloc.dart';
import 'package:todo_test2/bloc/tab/app_tab.dart';


class TabCubit extends Cubit<AppTab> {

  TabCubit() : super(AppTab.TODOS);

  tabUpdate(AppTab tab) {
    emit(tab);
  }
}
