import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/services/storage_services.dart';

class LocaleBloc extends Bloc<LocaleEvents, LocaleState> {
  final StorageServices storage;
  LocaleBloc(this.storage)
    : super(LocaleState(Locale(storage.currentLanguage))) {
    on<ChangeLocaleEvent>((event, emit) {});
  }
}

class LocaleState {
  final Locale locale;
  LocaleState(this.locale);
}

class LocaleEvents {}

class ChangeLocaleEvent extends LocaleEvents {
  final String langCode;
  ChangeLocaleEvent(this.langCode);
}
