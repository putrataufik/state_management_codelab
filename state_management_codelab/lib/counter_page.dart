import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hello/controller.dart';

class CounterCard extends StatelessWidget {
  final int counter;
  final int index;
  final VoidCallback onPressedIncrement;
  final VoidCallback onPressedDecrement;
  final VoidCallback onPressedDelete;
  final Color cardColor;
  final ValueSetter<Color> onColorChanged;

  CounterCard({
    required this.counter,
    required this.index,
    required this.onPressedIncrement,
    required this.onPressedDecrement,
    required this.onPressedDelete,
    required this.cardColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Counter ValueHai: $counter'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressedIncrement,
              child: Text('Increment'),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressedDecrement,
              child: Text('Decrement'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(25, 35),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressedDelete,
              child: Text('Delete'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            SizedBox(height: 10),
            ColorPicker(
              pickerColor: cardColor,
              onColorChanged: onColorChanged,
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidgetList extends StatefulWidget {
  @override
  _CounterWidgetList createState() => _CounterWidgetList();
}

class _CounterWidgetList extends State<CounterWidgetList> {
  List<int> counters = GlobalState.counters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              GlobalState.counters.add(0);
              GlobalState.cardColors.add(Color.fromARGB(255, 255, 255, 255));
            });
          },
          child: Text('Tambah Card'),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ReorderableListView(
            onReorder: (int oldPosition, int newPosition) {
              setState(() {
                if (newPosition > oldPosition) {
                  newPosition -= 1;
                }
                final int item = counters.removeAt(oldPosition);
                counters.insert(newPosition, item);
              });
            },
            children: counters.asMap().entries.map((entry) {
              final int index = entry.key;
              final int counter = entry.value;
              return ExpansionTile(
                key: Key('$index'),
                tilePadding: const EdgeInsets.all(10),
                initiallyExpanded: true,
                title: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CounterCard(
                      counter: counter,
                      index: index,
                      onPressedIncrement: () {
                        setState(() {
                          GlobalState.incrementCounter(index);
                        });
                      },
                      onPressedDecrement: () {
                        setState(() {
                          GlobalState.decrementCounter(index);
                        });
                      },
                      onPressedDelete: () {
                        setState(() {
                          GlobalState.deleteCounter(index);
                        });
                      },
                      cardColor: GlobalState.cardColors[index],
                      onColorChanged: (newColor) {
                        setState(() {
                          GlobalState.changeCardColor(index, newColor);
                        });
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}