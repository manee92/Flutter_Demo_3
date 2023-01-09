import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Sheets",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter bottom sheets"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomSheet1()));
                  },
                  child: const Text("Bottom Sheet 1")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomSheet2()));
                  },
                  child: const Text("Bottom Sheet 2")),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheet1 extends StatelessWidget {
  BottomSheet1({super.key});

  final categories = [
    "Shopping",
    "Education",
    "Personal",
    "Office",
    "Part time",
    "Other",
    "New"
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet 1"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ShowModalBottomSheet'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  height: h / 2,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 1 / 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      String cat = categories[index];
                      return InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            cat == "New"
                                ? const Icon(
                                    Icons.create_new_folder,
                                    color: Colors.deepOrangeAccent,
                                    size: 65,
                                  )
                                : Icon(
                                    Icons.folder,
                                    color: colors[Random().nextInt(9)],
                                    size: 75,
                                  ),
                            Text(
                              cat,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

List colors = const [
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

class BottomSheet2 extends StatelessWidget {
  const BottomSheet2({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet 3"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('ShowModalBottomSheet'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF457eee)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(500.0),
                    topRight: Radius.circular(0.0),
                  )),
              builder: (BuildContext context) {
                return Container(
                  height: h / 2,
                  padding: const EdgeInsets.only(left: 100, right: 30),
                  decoration: const BoxDecoration(
                      color: Color(0xFF457eee),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(500.0),
                        topRight: Radius.circular(0.0),
                      )),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          FeatherIcons.filePlus,
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Add new item or existing item from the list",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Long press on items to edit and add item details",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
