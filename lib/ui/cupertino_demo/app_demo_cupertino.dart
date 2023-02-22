import 'package:flutter/cupertino.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/events_screen.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/explore_screen.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/home_screen.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/profile_screen.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(fontFamily: "SF-Pro"))),
      debugShowCheckedModeBanner: false,
      home: NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Widget> tabs = [
    const HomeScreen(),
    const ExploreScreen(),
    const EventScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 55,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return tabs[index];
          },
        );
      },
    );
  }
}
