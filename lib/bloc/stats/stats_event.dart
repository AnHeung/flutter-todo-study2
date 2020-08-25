part of 'stats_bloc.dart';

@immutable
abstract class StatsEvent extends Equatable{


  @override
  List<Object> get props => [];

  const StatsEvent();
}

class StatsInitialize extends StatsEvent{}

class StatsUpdate extends StatsEvent{

  final List<Todo> updateList;

  const StatsUpdate({this.updateList});

  @override
  List<Object> get props =>[updateList];
}


