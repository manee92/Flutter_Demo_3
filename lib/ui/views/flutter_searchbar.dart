import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonApp());
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: const Color(0xff386a20),
          useMaterial3: true),
      title: 'Button Types',
      home: SearchBarDemo(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  List<Bird> selectedBirds = [];
  List<Bird> allBirds = [
    Bird(name: "Chestnut-headed Bee-eater", image: "assets/birds/bird-1.jpg"),
    Bird(name: "Eurasian Hoopoe", image: "assets/birds/bird-2.jpg"),
    Bird(name: "Changeable Hawk-eagle", image: "assets/birds/bird-3.jpg"),
    Bird(name: "Brahminy Starling", image: "assets/birds/bird-4.jpg"),
    Bird(name: "Blue-tailed Bee-eater", image: "assets/birds/bird-5.jpg"),
    Bird(name: "Indian Peafowl", image: "assets/birds/bird-6.jpg"),
    Bird(name: "Common Kingfisher", image: "assets/birds/bird-7.jpg"),
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(searchListener);
  }

  @override
  void dispose() {
    controller.removeListener(searchListener);
    super.dispose();
  }

  void searchListener() {
    search(controller.text);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        selectedBirds = allBirds;
      });
    } else {
      setState(() {
        selectedBirds = allBirds
            .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBar(
              hintText: "Search",
              controller: controller,
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.search),
              trailing: const [Icon(Icons.mic)],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: selectedBirds.isEmpty
                        ? allBirds.length
                        : selectedBirds.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Bird item = selectedBirds.isEmpty
                          ? allBirds[index]
                          : selectedBirds[index];

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    image: DecorationImage(
                                      image: AssetImage(item.image),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class SearchBarDemo extends StatelessWidget {
  SearchBarDemo({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBar(
              hintText: "Search",
              controller: controller,
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.search),
              trailing: const [Icon(Icons.mic)],
            ),
            const SizedBox(
              height: 30,
            ),
            SearchBar(
              hintText: "Search",
              controller: controller,
              surfaceTintColor: const MaterialStatePropertyAll<Color>(Color(0xffe94824)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.search),
              trailing:  [
                IconButton(onPressed: (){}, icon: const Icon(Icons.mic)),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar3.jpg"),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SearchBar(
              hintText: "Search",
              controller: controller,
              surfaceTintColor: const MaterialStatePropertyAll<Color>(Color(0xff2b3fc9)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.menu),
              trailing:  [
                IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.mic)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SearchBar(
              hintText: "Search",
              controller: controller,
              surfaceTintColor: const MaterialStatePropertyAll<Color>(Color(0xff0000d4)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.menu),
              trailing: const [
                 CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar3.jpg"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Bird {
  final String name;
  final String image;

  Bird({required this.name, required this.image});
}
