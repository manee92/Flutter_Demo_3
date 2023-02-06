import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
      child: const TravelApp()));
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change theme with provider"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ThemeProvider>().changeCurrentTheme();
              },
              icon: context.watch<ThemeProvider>().currentTheme == lightTheme
                  ? const Icon(
                      Icons.dark_mode,
                      color: Colors.black54,
                    )
                  : const Icon(
                      Icons.light_mode_outlined,
                      color: Colors.yellow,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: const [
            AttractionCard(
                name: "Lorem",
                detail:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                img: "assets/images/img004.jpg",
                country: "Ipsum"),
            SizedBox(
              height: 10,
            ),
            AttractionCard(
                name: "Lorem",
                detail:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                img: "assets/images/img002.jpg",
                country: "Ipsum"),
            SizedBox(
              height: 10,
            ),
            AttractionCard(
                name: "Lorem",
                detail:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                img: "assets/images/img003.jpg",
                country: "Ipsum"),
            SizedBox(
              height: 10,
            ),
            AttractionCard(
                name: "Lorem",
                detail:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                img: "assets/images/img001.jpg",
                country: "Ipsum"),
          ],
        ),
      ),
    );
  }
}

class AttractionCard extends StatelessWidget {
  final String img;
  final String name;
  final String country;
  final String detail;

  const AttractionCard(
      {Key? key,
      required this.img,
      required this.name,
      required this.country,
      required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeType theme = themeProvider.themeType;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: theme == ThemeType.dark
                              ? const Color(0xffcfcfcf)
                              : const Color(0xff4a4a4a)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      country,
                      style: TextStyle(
                          fontSize: 12,
                          color: theme == ThemeType.dark
                              ? const Color(0xffcfcfcf)
                              : const Color(0xff858585)),
                    ),
                  ],
                )),
                const Expanded(
                    flex: 0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//preferences
class SavePreference {
  // to set the mode
  Future<void> setTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }

// to get the mode
  Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme').toString();
  }
}


enum ThemeType { light, dark }

//Theme provider
class ThemeProvider extends ChangeNotifier {
  SavePreference pre = SavePreference();
  ThemeData currentTheme = lightTheme;
  ThemeType themeType = ThemeType.light;

  ThemeProvider() {
    setInitialTheme();
  }

  setInitialTheme() {
    ThemeData theme = lightTheme;
    pre.getTheme().then((value) {
      if (value != "null") {
        theme = (value == "dark") ? darkTheme : lightTheme;
      }
      currentTheme = theme;
      themeType = (theme == lightTheme) ? ThemeType.light : ThemeType.dark;
      notifyListeners();
    });
  }

  changeCurrentTheme() {
    if (currentTheme == darkTheme) {
      themeType = ThemeType.light;
      currentTheme = lightTheme;
    } else {
      themeType = ThemeType.dark;
      currentTheme = darkTheme;
    }
    pre.setTheme(themeType.name);
    notifyListeners();
  }
}


//theme data for each theme
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  cardTheme: const CardTheme(surfaceTintColor: Color(0xff101820)),
  fontFamily: "Lato",
  iconTheme: const IconThemeData(color: Color(0xffcfcfcf)),
  appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle:
      const TextTheme(headline4: TextStyle(color: Colors.white)).headline4),
);

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: const Color(0xff29b6f6),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  cardTheme: const CardTheme(surfaceTintColor: Colors.white),
  fontFamily: "Lato",
  appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle:
      const TextTheme(headline4: TextStyle(color: Colors.black)).headline4),
);
