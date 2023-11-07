import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'history_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Saya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(), 
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  int _previousIndex = 0;

  final List<Widget> _pages = [HomeWidget(), CounterWidgetList(), HistoryPage()];

  void _onTabTapped(int index) {
    setState(() {
      _previousIndex = _currentIndex;
      _currentIndex = index;
    });
  }

  void _backLogic() {
    setState(() {
      if (_previousIndex != _currentIndex) {
        // Kembali ke page sebelumnya
        _currentIndex = _previousIndex;
      } else {
        // Kembali ke Home Page kalo di ada d halaman Counter atau History
        _currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Saya'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? null
          : FloatingActionButton(
              onPressed: _backLogic,
              child: Icon(Icons.arrow_back),
            ),
    );
  }
}
