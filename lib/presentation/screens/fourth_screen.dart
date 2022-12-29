import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/constants/enum.dart';
import 'package:test/logic/cubit/status_cubit.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key, required this.color});
  final Color color;

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: const Text('Screen 4'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: (() {
                BlocProvider.of<StatusCubit>(context).setStatusActive();
              }),
              child: const Text("Set Status Active")),
          BlocConsumer<StatusCubit, StatusState>(builder: ((context, state) {
            return Text('${state.status}');
          }), listener: (((context, state) {
            if (state.isActive) {
              const snackBar = SnackBar(
                backgroundColor: Colors.green,
                content: Text("Active"),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              const snackBar = SnackBar(
                backgroundColor: Colors.grey,
                content: Text("Away"),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }))),
          GestureDetector(
              onTap: (() {
                BlocProvider.of<StatusCubit>(context).setStatusAway();
              }),
              child: const Text("Set Status Away")),
        ],
      )),
    );
  }
}
