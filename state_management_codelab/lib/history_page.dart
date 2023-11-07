// history_page.dart
import 'package:flutter/material.dart';
import 'package:hello/controller.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HistoryList(),
    );
  }
}

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: GlobalState.deletedCounters.length,
      itemBuilder: (context, index) {
        final deletedCounter = GlobalState.deletedCounters[index];
        final deletedColor = GlobalState.deletedCardColors[index];

        return Card(
          color: deletedColor,
          child: ListTile(
            title: Text('Deleted Counter Value: ${deletedCounter.counter}'),
          ),
        );
      },
    );
  }
}
