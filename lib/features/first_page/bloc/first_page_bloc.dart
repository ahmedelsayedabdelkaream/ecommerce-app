import 'package:ecommerce_app/features/first_page/bloc/first_page_events.dart';
import 'package:ecommerce_app/features/first_page/bloc/first_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPageBloc extends Bloc<FirstPageEvents, FirstPageStates> {
  FirstPageBloc() : super(FirstPageStates());
}
