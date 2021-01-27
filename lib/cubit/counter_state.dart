part of 'counter_cubit.dart';

//01. Definisikan state yang akan di proses oleh cubit
class CounterState {
  int counterValue;
  //nanti di tambahkan
  bool wasIncremented;

  CounterState({
    @required this.counterValue,
    //nanti ditambahkan
    this.wasIncremented,
  });
}
