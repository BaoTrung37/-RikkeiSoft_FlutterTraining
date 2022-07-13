part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

class HomeLoadedState extends HomeState {
  final String activityName;
  final String activityType;
  final int paticipants;
  const HomeLoadedState({
    required this.activityName,
    required this.activityType,
    required this.paticipants,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        activityName,
        activityType,
        paticipants,
      ];
}
