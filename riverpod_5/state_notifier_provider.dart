import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/name_notifier.dart';

class HomeStateNotifierProvider extends ConsumerWidget {
  const HomeStateNotifierProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final nameStateNotifierProvider = watch(nameNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(
          children: [
            Text(
              nameStateNotifierProvider.toString(),
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FloatingActionButton(
              onPressed: () => context
                  .read(nameNotifierProvider.notifier)
                  .addNames('Now you can add name!'),
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10.0,
            ),
            FloatingActionButton(
              onPressed: () => context
                  .read(nameNotifierProvider.notifier)
                  .updateNames('Now you can update the name!'),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
