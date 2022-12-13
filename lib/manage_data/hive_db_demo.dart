import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

const userBox = 'userBox';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();

  Hive
    ..init(directory.path)
    ..registerAdapter(UserAdapter());

  var box = await Hive.openBox<User>(userBox);

  box.put('david', User(name: 'David'));
  box.put('sandy', User(name: 'Sandy'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My Health Data",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: UserScreen(),
      ),
      // themeMode: ThemeMode.dark,
    );
  }
}

class User {
  String name;

  User({required this.name});

  @override
  String toString() => name; // Just for print()
}


// Can be generated automatically
class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User(name: reader.read());
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.name);
  }
}


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  late Box<User> users;

  @override
  void initState() {
    super.initState();
    users = Hive.box(userBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Users"),),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, listIndex) {
          User? user = users.getAt(listIndex);
          return ListTile(
            title: Text(user!.name),
            leading: const Icon(Icons.person),
          );
        },
      )
    );
  }
}


