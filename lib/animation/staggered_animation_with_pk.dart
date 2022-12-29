import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Colors.white, elevation: 0, iconTheme: IconThemeData()),
        brightness: Brightness.light,
        cardTheme: const CardTheme(elevation: 2),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "First Screen",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterScreen()),
                  );
                },
                icon: const Icon(Icons.filter))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Card(child: SizedBox(height: 100, width: width)),
              Card(child: SizedBox(height: 100, width: width)),
              Card(child: SizedBox(height: 100, width: width)),
              Card(child: SizedBox(height: 100, width: width)),
            ],
          ),
        ));
  }
}

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 100.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ImageThumbnail(image: "assets/places/img001.jpg", name: "Album 1"),
                    ImageThumbnail(image: "assets/places/img002.jpg", name: "Album 2"),
                    ImageThumbnail(image: "assets/places/img003.jpg", name: "Album 3"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ImageThumbnail(image: "assets/places/img004.jpg", name: "Album 4"),
                    ImageThumbnail(image: "assets/places/img005.jpg", name: "Album 5"),
                    ImageThumbnail(image: "assets/places/img006.jpg", name: "Album 6"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ImageThumbnail(image: "assets/places/img007.jpg", name: "Album 7"),
                    ImageThumbnail(image: "assets/places/img008.jpg", name: "Album 8"),
                    ImageThumbnail(image: "assets/places/img009.jpg", name: "Album 9"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          margin: const EdgeInsets.only(bottom: 6),
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
        Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 20)
      ],
    );
  }
}
