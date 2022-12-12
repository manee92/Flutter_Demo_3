import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gradient Card Demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Make It Gradient"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: GradientContainer(
                        title: "Lorem Ipsum",
                        detail:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        colorList: [
                          Color(0xff0099ff),
                          Color(0xff33ccff),
                        ],
                        tag: "tag1"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GradientContainer(
                        title: "Lorem Ipsum",
                        detail:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        colorList: [
                          Color(0xffff9933),
                          Color(0xffffcc99),
                        ],
                        tag: "tag2"),
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

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {Key? key,
      required this.title,
      required this.detail,
      required this.colorList,
      required this.tag})
      : super(key: key);

  final String title;
  final String detail;
  final List<Color> colorList;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colorList,
          )),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            detail,
            style: const TextStyle(
                fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: const Alignment(1, 1),
            child: FloatingActionButton(
              onPressed: () {},
              heroTag: tag,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.edit,
                color: Colors.black87,
              ),
              mini: true,
            ),
          )
        ],
      ),
    );
  }
}
