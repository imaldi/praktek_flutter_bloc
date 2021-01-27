import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktek_flutter_bloc/cubit/counter_cubit.dart';
import 'package:praktek_flutter_bloc/screen/HomeScreen.dart';
import 'package:praktek_flutter_bloc/screen/SecondScreen.dart';
import 'package:praktek_flutter_bloc/screen/ThirdScreen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: MyHomePage(
              title: "Home Screen",
              color: Colors.blueAccent,
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: SecondPage(
              title: "Second Screen",
              color: Colors.redAccent,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdPage(
              title: "Thirst Screen",
              color: Colors.greenAccent,
            ),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close;
  }
}
