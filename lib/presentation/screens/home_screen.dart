import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/logic/cubit/counter_cubit.dart';
import 'package:test/presentation/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Screen 1"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: '*',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second');
                    },
                    child: const Icon(Icons.screen_lock_landscape),
                  ),
                  FloatingActionButton(
                    heroTag: '&',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/third');
                    },
                    child: const Icon(Icons.screen_lock_landscape),
                  ),
                ],
              )
            ],
          ),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
