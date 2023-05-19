import 'package:flutter/material.dart';
import 'package:my_fitness_tracker/ui/buttons/segmented_button_demo.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Material Buttons"),
        ),
        body: const SingleChildScrollView(
          child: ButtonTypesExample(),
        ),
      ),
    );
  }
}

class ButtonTypesExample extends StatelessWidget {
  const ButtonTypesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          SingleChoice(),
          SizedBox(height: 20),
          MultipleChoice(),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ButtonTypesGroup(), ButtonWithIconsGroup()],
          ),
          Divider(),
          SizedBox(height: 20),
          IconButtonGroup(),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          ButtonWithStyle()
        ],
      ),
    );
  }
}

class ButtonTypesGroup extends StatelessWidget {
  const ButtonTypesGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
        FilledButton(onPressed: () {}, child: const Text('Filled Button')),
        FilledButton.tonal(onPressed: () {}, child: const Text('Filled Tonal')),
        OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
        TextButton(onPressed: () {}, child: const Text('Text Button')),
      ],
    );
  }
}

class ButtonWithIconsGroup extends StatelessWidget {
  const ButtonWithIconsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add')),
        FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.attach_file),
            label: const Text('Attach')),
        FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
            ),
            label: const Text('Send')),
        OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.thumb_up_alt_outlined),
            label: const Text('Like')),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            label: const Text('Favourite')),
      ],
    );
  }
}

class ButtonWithStyle extends StatelessWidget {
  const ButtonWithStyle({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              minimumSize: Size(width, 55),
              elevation: 4
          ),
          onPressed: () {},
          child: const Text('Create Account')),
    );
  }
}

class IconButtonGroup extends StatelessWidget {
  const IconButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: const Icon(Icons.filter_drama), onPressed: () {}),
            IconButton.filled(
                onPressed: () {}, icon: const Icon(Icons.filter_drama)),
            IconButton.filledTonal(
                onPressed: () {}, icon: const Icon(Icons.filter_drama)),
            IconButton.outlined(
                onPressed: () {}, icon: const Icon(Icons.filter_drama)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CloseButton(onPressed: () {}, color: const Color(0xff386a20)),
            BackButton(onPressed: () {}, color: const Color(0xff386a20)),
          ],
        ),
        const Divider(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Approve', style: TextStyle(color: Color(0xff386a20))),
              icon: const Icon(Icons.thumb_up, color: Color(0xff386a20),),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          ],
        )
      ],
    );
  }
}
