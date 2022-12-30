import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/logic/bloc/ticker_bloc.dart';

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
        appBar: AppBar(
            title: const Text('Screen 6'),
            centerTitle: true,
            backgroundColor: widget.color),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                FloatingActionButton(
                  heroTag: '+',
                  onPressed: () {
                    BlocProvider.of<TickerBloc>(context)
                        .add(const AddEvent(2, true, false));
                  },
                  child: const Icon(Icons.add),
                ),
                BlocConsumer<TickerBloc, TickerState>(
                    builder: ((context, state) {
                  if (state is TickerInitial) {
                    return const Text("0");
                  }
                  if (state is TickerAddState) {
                    return Text("${state.num}");
                  } else if (state is TickerSubtractState) {
                    return Text("${state.num}");
                  }
                  return const Text("");
                }), listener: ((context, state) {
                  if (state is TickerAddState) {
                    print("Added");
                  } else if (state is TickerSubtractState) {
                    print("Subtracted");
                  }
                })),
                FloatingActionButton(
                  heroTag: '-',
                  onPressed: () {
                    BlocProvider.of<TickerBloc>(context)
                        .add(const SubtractEvent(2, false, true));
                  },
                  child: const Icon(Icons.remove),
                ),
              ]),
            ],
          ),
        ));
  }
}
