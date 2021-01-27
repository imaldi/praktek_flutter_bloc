import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

//02. Buat class cubit, definisikan function
//yang akan dipanggil untuk merubah state ketika suatu event terjadi
class CounterCubit extends Cubit<CounterState> {
  //kita berikan 1initial state pada super constructor
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
