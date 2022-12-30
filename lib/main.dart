import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/logic/bloc/ticker_bloc.dart';
import 'package:test/logic/cubit/counter_cubit.dart';
import 'package:test/logic/cubit/internet_cubit.dart';
import 'package:test/logic/cubit/status_cubit.dart';
import 'package:test/presentation/router/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  MyApp({Key? key, required this.appRouter, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) => InternetCubit(connectivity: connectivity))),
        BlocProvider(create: ((context) => CounterCubit())),
        BlocProvider(create: ((context) => StatusCubit())),
        BlocProvider(create: ((context) => TickerBloc()))
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.onGeneratedRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
