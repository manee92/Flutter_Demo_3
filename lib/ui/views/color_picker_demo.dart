import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        title: "Custom color picker",
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color noteColor = const Color(0xFFfcf000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom color picker demo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showColorPallet(
              context: context,
              initColor: noteColor,
              changeColor: (val) {
                setState(() {
                  noteColor = val;
                });
              });
        },
        child: const Icon(
          Icons.color_lens_outlined,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: ColoredBox(
          color: noteColor,
          child: const Center(
            child: Text("Change my color"),
          )),
    );
  }
}

showColorPallet(
    {required BuildContext context, Color? initColor, changeColor}) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return CustomColorPicker(
          onSelectColor: (val) {
            changeColor(val);
          },
          initialColor: initColor ?? const Color(0xFFfcf000),
          availableColors: const [
            Color(0xFFFF9C99),
            Color(0xFF6fefb0),
            Color(0xFF8ac2ed),
            Color(0xFFdcccff),
            Color(0xFFFF0000),
            Color(0xFFFFb224),
            Color(0xFFF1453D),
            Color(0xFFf2a468),
            Color(0xFFcf8c82),
            Color(0xFFfcf000),
            Color(0xFFa729ac),
            Color(0xFFed3186),
            Color(0xFF801abd),
            Color(0xFFebadff),
            Color(0xFF32a852),
            Color(0xFF7e89e6),
            Color(0xFF9cc991),
            Color(0xFF1eaaf1),
          ]);
    },
  );
}

class CustomColorPicker extends StatefulWidget {
  final Function onSelectColor;
  final List<dynamic> availableColors;
  final Color initialColor;
  final bool circleItem;

  const CustomColorPicker(
      {Key? key,
      required this.onSelectColor,
      required this.availableColors,
      required this.initialColor,
      this.circleItem = true})
      : super(key: key);

  @override
  _CustomColorPickerState createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  late Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return SizedBox(
        height: h / 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: widget.availableColors.length,
              itemBuilder: (context, index) {
                final itemColor = widget.availableColors[index];
                return GestureDetector(
                  onTap: () {
                    widget.onSelectColor(itemColor);
                    setState(() {
                      _pickedColor = itemColor;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: itemColor,
                        shape: widget.circleItem == true
                            ? BoxShape.circle
                            : BoxShape.rectangle,
                        border: Border.all(width: 1, color: itemColor)),
                    child: itemColor == _pickedColor
                        ? const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                  ),
                );
              }),
        ));
  }
}
