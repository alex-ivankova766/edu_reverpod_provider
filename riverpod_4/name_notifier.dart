import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameNotifier extends StateNotifier<List<String>> {
  NameNotifier() : super([]);

  void addNames(String names) {
    state = [...state, names];
  }

  void deleteNames(String names) {
    state = [
      for (final loopNames in state)
        if (names != loopNames) loopNames,
    ];
  }
}

final nameNotifierProvider =
    StateNotifierProvider<NameNotifier, dynamic>((ref) {
  return NameNotifier();
});
