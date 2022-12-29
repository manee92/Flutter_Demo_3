import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'hive_db_travel_demo.g.dart';

const allAttractions = 'all_attractions';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PlaceAdapter());
  await Hive.openBox<Place>(allAttractions);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<Place> allPlaces;

  @override
  void initState() {
    super.initState();
    allPlaces = Hive.box(allAttractions);
  }

  void addInitialData() {
    if (allPlaces.isEmpty) {
      allPlaces.put(
          'place01', Place(name: 'Pyramid', image: 'assets/places/img001.jpg'));
      allPlaces.put(
          'place02',
          Place(
              name: 'Mirabell Palace and Garden',
              image: 'assets/places/img002.jpg'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Travel Book'),
        actions: [
          IconButton(onPressed: addInitialData, icon: const Icon(Icons.home)),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: allPlaces.listenable(),
        builder: (context, Box<Place> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, listIndex) {
              Place? place = box.getAt(listIndex);

              return AttractionCard(
                name: place!.name,
                image: place.image,
                icon: place.favorite ? Icons.favorite : Icons.favorite_border,
                onIconTap: () {
                  place.favorite = !place.favorite;
                  box.put(box.keyAt(listIndex), place);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class AttractionCard extends StatelessWidget {
  const AttractionCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.icon,
      this.onIconTap})
      : super(key: key);
  final String image;
  final String name;
  final IconData icon;
  final void Function()? onIconTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  height: 180,
                  width: width,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: onIconTap,
                        icon: Icon(
                          icon,
                          color: Colors.red,
                        ))
                  ],
                )
              ],
            )));
  }
}

@HiveType(typeId: 1)
class Place extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  bool favorite;

  Place({required this.name, required this.image, this.favorite = false});
}
