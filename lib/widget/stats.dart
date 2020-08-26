import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/stats/stats_bloc.dart';
import 'package:todo_test2/widget/loading_indicator.dart';

class Stats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state){
        if(state is StatsLoadingInProgress){
          return LoadingIndicator();
        }else if(state is StatsLoadSuccess){
          return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Completed Todos'),
                    Text('${state.numComplete}'),
                    SizedBox(height: 10,),
                    Text('Active Todos'),
                    Text('${state.numActive}'),
                  ],
                ),
              )
          );
        }
        return Container();
      },
    );
  }

}