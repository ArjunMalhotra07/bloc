import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Screen 3"),
          centerTitle: true,
        ),
        body: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            FloatingActionButton(
              heroTag: '+',
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              child: const Icon(Icons.add),
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: ((context, state) {
                if (state.didIncrement == true) {
                  const snackBar = SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (state.didIncrement == false) {
                  const snackBar = SnackBar(
                    content: Text("Decremented"),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }),
              builder: (context, state) {
                return Text("${state.counter}");
              },
            ),
            FloatingActionButton(
              heroTag: '-',
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              child: const Icon(Icons.remove),
            ),
          ]),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
