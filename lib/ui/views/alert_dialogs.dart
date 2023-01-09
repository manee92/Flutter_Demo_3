import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Alert dialogs",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter alerts"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


