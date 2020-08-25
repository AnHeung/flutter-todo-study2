import 'package:flutter/material.dart';
import 'package:todo_test2/bloc/tab/app_tab.dart';
import 'package:todos_app_core/todos_app_core.dart';

class TabSelector extends StatelessWidget{

  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  const TabSelector({@required this.activeTab, @required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index)=> onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) => BottomNavigationBarItem(
        icon: Icon(
            tab == AppTab.TODOS ? Icons.list : Icons.show_chart
        ),
        title: Text(tab == AppTab.TODOS ? 'TODO' : 'Stats')
      )).toList(),
    );
  }

}