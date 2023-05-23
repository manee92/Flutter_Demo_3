import 'package:flutter/material.dart';

void main() => runApp(const MaterialStatePropertyExampleApp());

class MaterialStatePropertyExampleApp extends StatelessWidget {
  const MaterialStatePropertyExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xffcb3ea6), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('MaterialStateProperty')),
        body: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: MaterialStatePropertyExample()),
      ),
    );
  }
}

class MaterialStatePropertyExample extends StatelessWidget {
  MaterialStatePropertyExample({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xff87ddff);
      }
      return const Color(0xff28bcef);
    }

    return Column(
      children: [
        SearchBar(
          hintText: "Search",
          controller: controller,
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 15)),
          leading: const Icon(Icons.search),
          trailing: const [Icon(Icons.mic)],
        ),
        const SizedBox(height: 20),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith(getColor),
          ),
          onPressed: () {},
          child: const Text('Text Button'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              )),
          onPressed: () {},
          child: const Text('Elevated Button'),
        ),
        const SizedBox(height: 20),
        FilledButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
            backgroundColor:
                const MaterialStatePropertyAll<Color>(Color(0xff55cba0)),
          ),
          onPressed: () {},
          child: const Text('Filled Button'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilterChip(
              label: const Text('Select chip'),
              selected: true,
              onSelected: (bool value) {},
              side: MaterialStateBorderSide.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const BorderSide(color: Color(0xff75007a));
                }
                return const BorderSide(color: Color(0xffeebedf));
              }),
            ),
            FilterChip(
              label: const Text('Select chip'),
              selected: false,
              onSelected: (bool value) {},
              side: MaterialStateBorderSide.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const BorderSide(color: Color(0xff75007a));
                }
                return const BorderSide(color: Color(0xffeebedf));
              }),
            )
          ],
        ),
      ],
    );
  }
}
