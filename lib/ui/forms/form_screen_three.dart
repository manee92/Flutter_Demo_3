import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

const primaryColor = Color(0xff24b0e7);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Form Demo 3",
      home: Scaffold(
        body: CustomForm3(),
      ),
    );
  }
}

class CustomForm3 extends StatefulWidget {
  const CustomForm3({Key? key}) : super(key: key);

  @override
  CustomForm1State createState() {
    return CustomForm1State();
  }
}

class CustomForm1State extends State<CustomForm3> {
  final _formKey = GlobalKey<FormState>();
  List<Widget> productsInput = [];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form View"),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "List products you want to buy",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              MultiInputSection(
                inputList: productsInput,
                primaryColor: primaryColor,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
            minimumSize: Size(w, 46),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // the data submission.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          },
          child: const Text(
            'Submit',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class MultiInputSection extends StatefulWidget {
  final List<Widget> inputList;
  final Color primaryColor;
  const MultiInputSection(
      {Key? key, required this.inputList, required this.primaryColor})
      : super(key: key);

  @override
  MultiInputSectionState createState() => MultiInputSectionState();
}

class MultiInputSectionState extends State<MultiInputSection> {
  fillInputs() {
    if (widget.inputList.isEmpty) {
      widget.inputList.add(InputSectionField(
        key: Key(DateTime.now().toString()),
        onAddTap: onAddInput,
        idx: 0,
        dataList: widget.inputList,
        onRemove: onRemove,
        primaryColor: widget.primaryColor,
      ));
    }
    setState(() {});
  }

  onRemove(k) {
    widget.inputList.removeWhere((element) => element.key == k);
    setState(() {});
  }

  onAddInput(isEnabled) {
    if (isEnabled) {
      widget.inputList.add(InputSectionField(
        key: Key(DateTime.now().toString()),
        onAddTap: onAddInput,
        idx: widget.inputList.length,
        dataList: widget.inputList,
        onRemove: onRemove,
        primaryColor: widget.primaryColor,
      ));
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fillInputs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.inputList,
    );
  }
}

class InputSectionField extends StatefulWidget {
  final Function onAddTap;
  final Function onRemove;
  final int idx;
  final List<Widget> dataList;
  final Color primaryColor;
  const InputSectionField({
    required Key key,
    required this.onAddTap,
    required this.onRemove,
    required this.idx,
    required this.dataList,
    required this.primaryColor,
  }) : super(key: key);

  @override
  InputSectionFieldState createState() => InputSectionFieldState();
}

class InputSectionFieldState extends State<InputSectionField> {
  final _ctrl = TextEditingController();
  bool isEnabled = false;
  bool removable = false;
  late Color cl;
  Icon icon = const Icon(
    Icons.add,
    color: Colors.white,
    size: 22,
  );

  setIconColor() {
    cl = widget.primaryColor;
  }

  setIcon() {
    if (isEnabled && (widget.dataList.length > widget.idx)) {
      setState(() {
        removable = true;
        icon = const Icon(Icons.close, color: Colors.grey, size: 22);
        cl = const Color(0xFFCDCECE);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cl = widget.primaryColor.withOpacity(.5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        key: widget.key,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 12.0, top: 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _ctrl,
                      key: widget.key,
                      onChanged: (String value) {
                        if (value.isEmpty) {
                          cl = const Color(0xFFCDCECE);
                          setState(() {
                            isEnabled = false;
                          });
                        } else if (value.length == 1 && !removable) {
                          setIconColor();
                          setState(() {
                            isEnabled = true;
                          });
                        }
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: widget.primaryColor)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: cl,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                          onTap: () {
                            if (!removable) {
                              widget.onAddTap(isEnabled);
                              setIcon();
                            } else {
                              widget.onRemove(widget.key);
                            }
                          },
                          child: icon),
                    ),
                  ),
                ],
              ))
        ]);
  }
}


