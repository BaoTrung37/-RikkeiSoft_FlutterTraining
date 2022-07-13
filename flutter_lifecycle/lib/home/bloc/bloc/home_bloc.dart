import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_lifecycle/services/border_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;
  HomeBloc(this._boredService) : super(HomeInitial()) {
    on<LoadApiEvent>(
      (event, emit) async {
        final activity = await _boredService.getBoredActivity();
        emit(
          HomeLoadedState(
            activityName: activity.activity,
            activityType: activity.type,
            paticipants: activity.participants,
          ),
        );
      },
    );
  }
}
