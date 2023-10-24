import 'package:flutter/material.dart';

void main() {
  runApp(MyStatelessApp());
}

class MyStatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateless Counter App')),
        body: CounterWidgetState(),
      ),
    );
  }
}


// disini saya buat class baru yang extend ke StatefulWidget agar class CounterWidget bisa
// menggunakan function createState.
class CounterWidgetState extends StatefulWidget {
  @override
  _CounterWidget createState() => _CounterWidget();
}

// nah disini class _CounterWidget menggunakan extends State dari CounterWidgetState yang sudah
// di deklarasi bahwa _counterWidget sudah menggunakan function createState
class _CounterWidget extends State<CounterWidgetState> {
  // pas sudah di atur agar class _CounterWidget bisa menggunakan StateFull

  int counter = 0; // yang pertama itu kita bikin variable dlu
  Color buttonColor = Colors.red;
  double lebar = 30;
  double tinggi = 30;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Counter Value: $counter'), // ambil value yang ada di variable counter
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState( // nah disini kita sudah bisa menggunakan setState karena kita sudah extend class nya 
              // menggunakan CounterWidgetState tadi
                (){
                  counter ++; // tinggal kita bikin kek bgini :)
                  buttonColor = buttonColor == Colors.red ? Colors.blue : Colors.red;
                  lebar + 10;
                  tinggi + 10;
                }
                );
            },
            child: Text('Increment'),
            style: ElevatedButton.styleFrom(
              primary: buttonColor,

               
              minimumSize: Size(lebar, tinggi),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            setState(() {
              counter = 0;  
              lebar = 10;
              tinggi = 10;
            });
          }, 
          child: Text('reset'),
          ),
        ],
      ),
    );
  }
}