part of 'stats_bloc.dart';

@immutable
abstract class StatsState extends Equatable {
  @override
  List<Object> get props => [];

  const StatsState();
}

class StatsLoadingInProgress extends StatsState {}

class StatsLoadSuccess extends StatsState {
  final int numActive;
  final int numComplete;
  
  const StatsLoadSuccess({this.numActive, this.numComplete});

  @override
  List<Object> get props => [numActive, numComplete];
}
