import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/search/bloc/search_events.dart';
import 'package:ecommerce_app/features/search/bloc/search_states.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchPageBloc extends Bloc<SearchPageEvents, SearchPageStates> {
  SearchPageBloc() : super(SearchPageStates()) {
    on<OnSearchChange>((event, emit) {
      emit(state.copyWith(query: event.query));
    }, transformer: debounce(Duration(milliseconds: 800)));
  }
}
