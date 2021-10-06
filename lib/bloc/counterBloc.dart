// ignore_for_file: file_names

// ignore_for_file: camel_case_types

import 'package:bloc_package/bloc/counterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counterEvent.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is counterArttir) {
      yield CounterState(state.sayac + 1);
    } else {
      yield CounterState(state.sayac - 1);
    }
  }
}
