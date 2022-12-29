import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/logic/cubit/status_cubit.dart';
import 'package:test/presentation/screens/fourth_screen.dart';
import 'package:test/presentation/screens/home_screen.dart';
import 'package:test/presentation/screens/second_screen.dart';
import 'package:test/presentation/screens/thid_screen.dart';

class AppRouter {
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: ((_) => const FirstScreen()));

      case '/second':
        return MaterialPageRoute(
            builder: ((_) => const SecondScreen(
                  color: Colors.pink,
                )));

      case '/third':
        return MaterialPageRoute(
            builder: ((_) => ThirdScreen(
                  color: Colors.green,
                )));
      case '/fourth':
        return MaterialPageRoute(
            builder: ((_) => FourthScreen(
                  color: Colors.purple,
                )));

      default:
        return null;
    }
  }
}
