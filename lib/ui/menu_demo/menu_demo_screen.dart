import 'package:flutter/material.dart';

enum MenuItem { itemOne, itemTwo, itemThree, itemFour, itemFive }

void main() => runApp(const PopupMenuApp());

class PopupMenuApp extends StatelessWidget {
  const PopupMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff008900)),
      home: const PopupMenuExample(),
    );
  }
}

class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  MenuItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu demo'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.star_border)),
            PopupMenuButton<MenuItem>(
              // offset: const Offset(0, 45),
              icon: const Icon(Icons.more_vert),
              initialValue: selectedMenu,
              onSelected: (MenuItem item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.itemOne,
                  child: Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Preview')
                    ],
                  ),
                ),
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.itemTwo,
                  child: Row(
                    children: [
                      Icon(Icons.share_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Share')
                    ],
                  ),
                ),
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.itemThree,
                  child: Row(
                    children: [
                      Icon(Icons.link),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Get Link')
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.itemFour,
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Remove')
                    ],
                  ),
                ),
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.itemFive,
                  child: Row(
                    children: [
                      Icon(Icons.download_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Download')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              SizedBox(
                height: height / 3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      height: height / 3,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/places/img003.jpg"),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: height / 3,
                      width: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/places/img002.jpg"),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What is Lorem Ipsum?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                            )
                          ])))
            ],
          ),
        ));
  }
}
