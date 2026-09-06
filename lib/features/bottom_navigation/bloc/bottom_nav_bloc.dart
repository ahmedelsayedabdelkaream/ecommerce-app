import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/bottom_navigation/bloc/bottom_nav_events.dart';
import 'package:ecommerce_app/features/bottom_navigation/bloc/bottom_nav_states.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvents, BottomNavigationStates> {
  BottomNavigationBloc() : super(BottomNavigationStates()) {
    on<BottomNavigationEvent>((event, emit) {
      emit(state.copyWith(currIndex: event.index));
    });
  }
}
