import 'package:flutter/material.dart';


class CounterInfo {
  int counter;
  Color color;

  CounterInfo(this.counter, this.color);
}

class GlobalState {
  static List<int> counters = [0];
  static List<Color> cardColors = [Color.fromARGB(255, 44, 38, 38)];
  static List<CounterInfo> deletedCounters = [];
  static List<Color> deletedCardColors = [];

  static void incrementCounter(int index) {
    counters[index]++;
  }

  static void decrementCounter(int index) {
    if (counters[index] > 0) {
      counters[index]--;
    }
  }

  static void deleteCounter(int index) {
    deletedCounters.add(CounterInfo(counters[index], cardColors[index]));
    deletedCardColors.add(cardColors[index]);
    counters.removeAt(index);
    cardColors.removeAt(index);
  }

  static void changeCardColor(int index, Color newColor) {
    cardColors[index] = newColor;
  }
}
