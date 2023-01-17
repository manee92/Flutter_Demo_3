import 'dart:math';
import 'package:flutter/material.dart';

final List<int> _items = List<int>.generate(20, (int index) => index);

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff967be3),
        useMaterial3: true,
      ),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});

  @override
  State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        scrolledUnderElevation: 5,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      body: GridView.builder(
        itemCount: _items.length,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: colors[Random().nextInt(9)],
            ),
            child: Text(
              '$index',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}

List<Color> colors = const [
  Color(0xFFFF9C99),
  Color(0xFFFFb224),
  Color(0xFFdcccff),
  Color(0xFF6b6b6b),
  Color(0xFF32a852),
  Color(0xFF1eaaf1),
  Color(0xFF8ac2ed),
  Color(0xFF7e89e6),
  Color(0xFFf86673)
];
