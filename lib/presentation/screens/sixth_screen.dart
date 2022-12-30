import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({super.key, required this.color});
  final Color color;

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: widget.color),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                FloatingActionButton(
                  heroTag: '+',
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                // BlocConsumer<CounterCubit, CounterState>(
                //   listener: ((context, state) {
                //     if (state.didIncrement == true) {
                //       const snackBar = SnackBar(
                //         content: Text("Incremented"),
                //         duration: Duration(seconds: 1),
                //       );
                //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //     } else if (state.didIncrement == false) {
                //       const snackBar = SnackBar(
                //         content: Text("Decremented"),
                //         duration: Duration(seconds: 1),
                //       );
                //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //     }
                //   }),
                //   builder: (context, state) {
                //     return Text("${state.counter}");
                //   },
                // ),
                FloatingActionButton(
                  heroTag: '-',
                  onPressed: () {},
                  child: const Icon(Icons.remove),
                ),
              ]),
            ],
          ),
        ));
  }
}
