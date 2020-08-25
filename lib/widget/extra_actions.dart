import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/models/extra_action.dart';

class ExtraActions extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc , TodoState>(
      builder: (context, state)=> PopupMenuButton<ExtraAction>(
        onSelected: (action){
          switch(action){
            case ExtraAction.CLEAR_COMPLETE :
               BlocProvider.of<TodoBloc>(context).add(ClearComplete());
              break;
            case ExtraAction.TOGGLE_ALL_COMPLETE :
              BlocProvider.of<TodoBloc>(context).add(ToggleAllComplete());
              break;
          }
        },
        itemBuilder:(BuildContext context)=><PopupMenuItem<ExtraAction>>[
          PopupMenuItem<ExtraAction>(
            value: ExtraAction.TOGGLE_ALL_COMPLETE,
            child: Text('all Complete'),
          ),
          PopupMenuItem<ExtraAction>(
            value: ExtraAction.CLEAR_COMPLETE,
            child: Text('toggle All'),
          ),
        ],

      ),
    );
  }

}