import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardPickerViewModel extends StateNotifier<int> {
  CardPickerViewModel() : super(-1);

  void selectCard(int index) {
    state = index;
  }
}

final StateNotifierProvider<CardPickerViewModel, int> cardPickerProvider = StateNotifierProvider<CardPickerViewModel, int>((ref) {
  return CardPickerViewModel();
});
