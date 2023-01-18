import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/fetch_data_bloc.dart';
import 'package:test/presentation/widgets/skeleton_loader.dart';

class APIBLOCScreen extends StatefulWidget {
  const APIBLOCScreen({super.key});

  @override
  State<APIBLOCScreen> createState() => _APIBLOCScreenState();
}

class _APIBLOCScreenState extends State<APIBLOCScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FetchDataBloc>().add(const FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<FetchDataBloc, FetchDataState>(
        builder: (context, state) {
          if (state is FetchingDataState) {
            return SkeletonLoader();
          } else if (state is DataLoadedState) {
            return Container(
              child: const Text("Data has been loaded"),
            );
          }
          return const Center(child: Text("hlo"));
        },
      ),
    );
  }
}
