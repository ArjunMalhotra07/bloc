import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/presentation/screens/home_screen.dart';
import 'package:test/presentation/screens/second_screen.dart';
import 'package:test/presentation/screens/thid_screen.dart';

import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubitInstance = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubitInstance,
              child: const FirstScreen(),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubitInstance,
              child: const SecondScreen(
                color: Colors.pink,
              ),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubitInstance,
              child: ThirdScreen(color: Colors.green),
            ),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    _counterCubitInstance.close();
    super.dispose();
  }
}
