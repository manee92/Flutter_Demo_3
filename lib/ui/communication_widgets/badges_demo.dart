import 'package:flutter/material.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xffffdad9)),
      home: const BadgesDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BadgesDemo extends StatefulWidget {
  const BadgesDemo({super.key});

  @override
  State<BadgesDemo> createState() => _BadgesDemoState();
}

class _BadgesDemoState extends State<BadgesDemo> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Badges Demo"),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Badge(child: Icon(Icons.image)),
            icon: Badge(child: Icon(Icons.image_outlined)),
            label: 'Images',
          ),
          NavigationDestination(
            selectedIcon:
                Badge(child: Icon(Icons.access_time_filled), label: Text("10")),
            icon: Badge(child: Icon(Icons.access_time), label: Text("10")),
            label: 'Recent',
          ),
          NavigationDestination(
            selectedIcon:
                Badge(child: Icon(Icons.people_alt), label: Text("3")),
            icon:
                Badge(child: Icon(Icons.people_alt_outlined), label: Text("3")),
            label: 'Sharing',
          ),
          NavigationDestination(
            selectedIcon:
                Badge(label: Text("245+"), child: Icon(Icons.file_copy)),
            icon: Badge(
                child: Icon(Icons.file_copy_outlined), label: Text("245+")),
            label: 'Library',
          ),
        ],
      ),
      body: <Widget>[
        GalleryScreen(),
        RecentScreen(),
        SharingScreen(),
        LibraryScreen(),
      ][currentPageIndex],
    );
  }
}

class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);
  final List<String> imageList = [
    "assets/flowers/img-1.jpg",
    "assets/flowers/img-2.jpg",
    "assets/flowers/img-3.jpg",
    "assets/flowers/img-4.jpg",
    "assets/flowers/img-5.jpg",
    "assets/flowers/img-6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 8,
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                  image: AssetImage(imageList[index]), fit: BoxFit.cover)),
          child: Container(
            height: 36,
            padding: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Album ${index + 1}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const Expanded(
                    flex: 0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RecentScreen extends StatelessWidget {
  RecentScreen({Key? key}) : super(key: key);

  final List<String> imageList = [
    "assets/flowers/img-3.jpg",
    "assets/flowers/img-1.jpg",
    "assets/flowers/img-7.jpg",
    "assets/flowers/img-5.jpg",
    "assets/flowers/img-4.jpg",
    "assets/flowers/img-2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 8,
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                  image: AssetImage(imageList[index]), fit: BoxFit.cover)),
        );
      },
    );
  }
}

class SharingScreen extends StatelessWidget {
  SharingScreen({Key? key}) : super(key: key);
  final List<String> imageList = [
    "assets/flowers/img-3.jpg",
    "assets/flowers/img-1.jpg",
    "assets/flowers/img-4.jpg",
    "assets/flowers/img-5.jpg",
    "assets/flowers/img-6.jpg",
    "assets/flowers/img-2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 8,
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                  image: AssetImage(imageList[index]), fit: BoxFit.cover)),
        );
      },
    );
  }
}

class LibraryScreen extends StatelessWidget {
  LibraryScreen({Key? key}) : super(key: key);
  final List<String> imageList = [
    "assets/flowers/img-1.jpg",
    "assets/flowers/img-2.jpg",
    "assets/flowers/img-3.jpg",
    "assets/flowers/img-4.jpg",
    "assets/flowers/img-5.jpg",
    "assets/flowers/img-6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 8,
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                  image: AssetImage(imageList[index]), fit: BoxFit.cover)),
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Album $index",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const Expanded(
                    flex: 0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
