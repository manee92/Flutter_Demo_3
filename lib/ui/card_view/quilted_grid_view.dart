import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Staggered view",
      home: ImageGridView()
    );
  }
}

class ImageGridView extends StatelessWidget {
  ImageGridView({Key? key}) : super(key: key);

  final List<String> imageList = [
    "assets/images/img001.jpg",
    "assets/images/img002.jpg",
    "assets/images/img003.jpg",
    "assets/images/img004.jpg",
    "assets/images/img005.jpg",
    "assets/images/img006.jpg",
    "assets/images/img007.jpg",
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg",
    "assets/images/image6.jpg",
    "assets/images/image7.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quilted Grid View"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.custom(
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: const [
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 2),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) => ImageTile(
                  img: imageList[index],
                ),
                childCount: 14),
          ),
        ));
  }
}

class ImageTile extends StatelessWidget {
  final String img;
  const ImageTile({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)));
  }
}
