import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/name_notifier.dart';

class HomeStateNotifierProvider extends ConsumerWidget {
  const HomeStateNotifierProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final nameStateNotifierProvider = watch(nameNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Text(
                nameStateNotifierProvider[index].toString(),
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
            itemCount: nameStateNotifierProvider.length,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: 'Add Name',
            onPressed: () => context
                .read(nameNotifierProvider.notifier)
                .addNames('Now you can add as many names as you want!'),
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            tooltip: 'Clear all Names',
            onPressed: () => context
                .read(nameNotifierProvider.notifier)
                .deleteNames('Now you can add as many names as you want!'),
            child: Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
