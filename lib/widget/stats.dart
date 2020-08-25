import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/stats/stats_bloc.dart';

class Stats extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state)=>Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Completed Todos'),
              Text('1'),
              SizedBox(height: 10,),
              Text('Active Todos'),
              Text('2'),
            ],
          ),
        )
      ),
    );
  }

}