// home_page.dart
import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'history_page.dart';
import 'package:hello/controller.dart';


class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Jumlah Counter Sekarang:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${GlobalState.counters.length}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
