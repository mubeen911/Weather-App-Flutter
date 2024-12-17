import 'package:design/bloc/counter_event.dart';
import 'package:design/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlock extends Bloc<CounterEvent, CounterState> {
  CounterBlock() : super(CounterState(0)) {
    on<CounterIncrement>((event, emit) {
      emit(CounterState(state.value + 1));
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterState(state.value - 1));
    });
  }
}
