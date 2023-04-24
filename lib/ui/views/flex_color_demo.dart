import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlexColorScheme"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ThemeProvider>().changeCurrentTheme();
              },
              icon: context.watch<ThemeProvider>().currentTheme == lightTheme
                  ? const Icon(
                      Icons.dark_mode,
                    )
                  : const Icon(
                      Icons.light_mode_outlined,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/places/img004.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width,
              height: height / 3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recommended for you",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: height / 6,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/places/img001.jpg"),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: height / 6,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/places/img003.jpg"),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width,
              height: height / 4,
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Container(
                        height: height / 4,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Card(
                      child: Container(
                        alignment: Alignment.center,
                        height: height / 4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

ThemeData lightTheme =
    FlexThemeData.light(useMaterial3: true, scheme: FlexScheme.deepOrangeM3);

ThemeData darkTheme =
    FlexThemeData.dark(useMaterial3: true, scheme: FlexScheme.deepOrangeM3);


