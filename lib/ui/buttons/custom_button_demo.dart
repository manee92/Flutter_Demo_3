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
          colorSchemeSeed: const Color(0xff386a20), useMaterial3: true),
      title: 'Button Types',
      home: const Scaffold(
        body: ButtonTypesExample(),
      ),
    );
  }
}

class ButtonTypesExample extends StatelessWidget {
  const ButtonTypesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GradientButton(
              colorList: <Color>[
                Color(0xffff6c42),
                Color(0xffff8764),
                Color(0xffffa990),
              ],
            ),
            SizedBox(height: 20),
            GradientButton(
              colorList: <Color>[
                Color(0xff09bf8c),
                Color(0xff55cba0),
                Color(0xff8dd9bb),
              ],
            ),
            SizedBox(height: 20),
            ContainerGradientButton(
              colorList: <Color>[
                Color(0xffcb3ea6),
                Color(0xffd664b5),
                Color(0xffe492ca),
              ],
            ),
            SizedBox(height: 20),
            ContainerGradientButton(
              colorList: <Color>[
                Color(0xff35c6f5),
                Color(0xff57d0fb),
                Color(0xff87ddff),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({Key? key, required this.colorList}) : super(key: key);
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colorList),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Gradient button'),
          ),
        ],
      ),
    );
  }
}

class ContainerGradientButton extends StatelessWidget {
  const ContainerGradientButton({Key? key, required this.colorList})
      : super(key: key);

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: () {},
      child: Container(
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            gradient: LinearGradient(
                colors: colorList)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Text(
          "Gradient button",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
