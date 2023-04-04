// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_counter/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final Counter counter = Counter();

  List<int> counts = [0, 0, 0];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    reaction((_) => currentIndex, (int index) {
      setState(() {
        currentIndex = index;
        counter.count = counts[currentIndex];
      });
    });
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      counter.count = counts[currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Observer(
                  builder: (_) => Text(
                    '${counts[currentIndex]}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    counter.increment();
                    setState(() {
                      counts[currentIndex] = counter.count;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Observer(
                  builder: (_) => Text(
                    '${counts[currentIndex]}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    counter.increment();
                    setState(() {
                      counts[currentIndex] = counter.count;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Observer(
                  builder: (_) => Text(
                    '${counts[currentIndex]}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    counter.increment();
                    setState(() {
                      counts[currentIndex] = counter.count;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tab),
            label: '1st Tab',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tab),
            label: '2nd Tab',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tab),
            label: '3rd Tab',
          ),
        ],
      ),
    );
  }
}
