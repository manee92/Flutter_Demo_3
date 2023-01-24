import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleItemConvexBar(),
    );
  }
}

class SingleItemConvexBar extends StatelessWidget {
  const SingleItemConvexBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convex App Bar'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: buttonBox(context: context)),
      bottomNavigationBar: ConvexButton.fab(
          thickness: 30, onTap: () {}, color: Colors.redAccent),
    );
  }
}

class ReactStyleConvexAppBar extends StatelessWidget {
  const ReactStyleConvexAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('React Style Convex AppBar'),
        backgroundColor: Colors.greenAccent,
      ),
      body: const Center(child: Text('React Style Convex AppBar')),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: Colors.greenAccent,
        items: const [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
          TabItem(icon: Icons.supervised_user_circle),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}

class FixedConvexAppBar extends StatelessWidget {
  const FixedConvexAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fixed Convex AppBar'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Center(child: Text('Fixed Convex AppBar')),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.orangeAccent,
        items: const [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}

class ConvexBarWithBadge extends StatelessWidget {
  const ConvexBarWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Convex Bar With Badge'),
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(child: Text('Convex Bar With Badge')),
        bottomNavigationBar: ConvexAppBar.badge(
          const {
            0: '99+',
            1: Icons.assistant_photo,
            2: Colors.red
          },
          badgeMargin: const EdgeInsets.only(top: 0, right: 0, left: 20, bottom: 30),
          backgroundColor: Colors.blueAccent,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
          ],
          onTap: (int i) => print('click index=$i'),
        ));
  }
}



Widget buttonBox({required BuildContext context}) {
  return Column(
    children: [
      Row(
        children: [
          smallButton(
              context: context,
              color: Colors.redAccent,
              text: "Single button bar",
              onTap: () {}),
          smallButton(
              context: context,
              text: "React Style Convex AppBar",
              color: Colors.greenAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReactStyleConvexAppBar()),
                );
              }),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          smallButton(
              context: context,
              text: "Fixed convex bar",
              color: Colors.orangeAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FixedConvexAppBar()),
                );
              }),
          smallButton(
              context: context,
              text: "Convex bar with badge",
              color: Colors.blueAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConvexBarWithBadge()),
                );
              }),

        ],
      ),
    ],
  );
}

Widget smallButton(
    {required BuildContext context,
    required String text,
    required Color color,
    required void Function()? onTap}) {
  return Expanded(
      child: GestureDetector(
    onTap: onTap,
    child: ColoredBox(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  ));
}


