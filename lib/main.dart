import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktek_flutter_bloc/cubit/counter_cubit.dart';
import 'package:praktek_flutter_bloc/route/app_route.dart';
import 'package:praktek_flutter_bloc/screen/HomeScreen.dart';
import 'package:praktek_flutter_bloc/screen/SecondScreen.dart';

import 'screen/ThirdScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
