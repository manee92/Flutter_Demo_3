import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarMediumApp());
}

class AppBarMediumApp extends StatelessWidget {
  const AppBarMediumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar.medium(
              backgroundColor: Colors.redAccent,
              surfaceTintColor: Colors.redAccent,
              leading:
                  IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
              title: const Text('Medium App Bar'),
              actions: <Widget>[
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            SliverToBoxAdapter(
              child: Card(
                surfaceTintColor: Colors.white,
                child: SizedBox(
                  height: 1200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 100, 8, 100),
                    child: Text(
                      'Scrolling content...',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
