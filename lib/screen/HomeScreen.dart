import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktek_flutter_bloc/cubit/counter_cubit.dart';
import 'package:praktek_flutter_bloc/screen/SecondScreen.dart';

import 'ThirdScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Incremented!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          } else if (state.wasIncremented == false) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Decremented!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: Text('${widget.title}'),
                    onPressed: () {
                      //03a. Panggil method decrement dari instance cubit yang tersedia pada konteks ini
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: Text('${widget.title} #2'),
                    onPressed: () {
                      //03b. Panggil method increment dari instance cubit yang tersedia pada konteks ini
                      BlocProvider.of<CounterCubit>(context).increment();
                      // context.bloc<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.redAccent,
                child: Text(
                  'Go to Second Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/second',
                  );
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return BlocProvider.value(
                  //     value: BlocProvider.of<CounterCubit>(context),
                  //     child: SecondPage(
                  //       title: 'SecondSreen',
                  //       color: Colors.redAccent,
                  //     ),
                  //   );
                  // }));
                },
              ),
              MaterialButton(
                color: Colors.redAccent,
                child: Text(
                  'Go to Third Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/third',
                  );
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return BlocProvider.value(
                  //     value: BlocProvider.of<CounterCubit>(context),
                  //     child: ThirdPage(
                  //       title: 'Third Screen',
                  //       color: Colors.green,
                  //     ),
                  //   );
                  // }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
