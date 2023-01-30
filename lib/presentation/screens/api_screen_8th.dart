import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/fetch_data/fetch_data_bloc.dart';
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
          if (state is ErrorOccuredWhileFetchingData) {
            return const Center(
              child: Text("Error"),
            );
          } else if (state is DataLoadedState) {
            return Container(
              child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: ((context, index) {
                    var item = state.data[index];

                    return ListTileWidget(
                        id: item.id.toString(),
                        title: item.title,
                        userID: item.userId.toString());
                  })),
            );
          }
          return SkeletonLoader();
        },
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  String? id;
  String? userID;
  String? title;
  ListTileWidget({this.id, this.title, this.userID, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.lightBlueAccent,
        title: Text(title.toString()),
        subtitle: Text(id.toString()),
      ),
    );
  }
}
