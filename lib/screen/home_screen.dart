import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/tab/app_tab.dart';
import 'package:todo_test2/bloc/tab/tab_cubit.dart';
import 'package:todo_test2/constants/routes.dart';
import 'package:todo_test2/widget/extra_actions.dart';
import 'package:todo_test2/widget/filter_button.dart';
import 'package:todo_test2/widget/filter_todo.dart';
import 'package:todo_test2/widget/stats.dart';
import 'package:todo_test2/widget/tab_selector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, AppTab>(
      builder: (context, activeTab) => Scaffold(
        appBar: AppBar(
          title: Text('todo'),
          actions: [
            FilterButton(visible: activeTab == AppTab.TODOS,),
            ExtraActions(),
          ],
        ),
        body: activeTab == AppTab.TODOS ? FilterTodo() : Stats(),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.pushNamed(context, Routes.addScreen),
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: TabSelector(
          activeTab: activeTab,
          onTabSelected:(appTab)=> BlocProvider.of<TabCubit>(context).tabUpdate(appTab),
        ),
      ),
    );
  }
}
