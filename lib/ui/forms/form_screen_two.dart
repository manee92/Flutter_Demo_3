import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

const primaryColor = Color(0xff24b0e7);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Form Demo 2",
      home: Scaffold(
        body: CustomForm2(),
      ),
    );
  }
}

class CustomForm2 extends StatefulWidget {
  const CustomForm2({Key? key}) : super(key: key);


  @override
  CustomForm2State createState() {
    return CustomForm2State();
  }
}

class CustomForm2State extends State<CustomForm2> {
  final _formKey = GlobalKey<FormState>();
  List<int> optionOneList = [];
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController dobCtrl = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy/MM/dd");
  String visiting = "No";
  int selectedItem = 0;

  List<int> rating = [];
  final List<int> numList = [1, 2, 3, 4, 5];

  List<QueItem> listOne = [
    QueItem(id: 1, name: "One"),
    QueItem(id: 2, name: "Two"),
    QueItem(id: 3, name: "Three"),
    QueItem(id: 4, name: "Four"),
    QueItem(id: 5, name: "Five"),
    QueItem(id: 6, name: "Six"),
    QueItem(id: 7, name: "Seven"),
    QueItem(id: 8, name: "Eight"),
  ];

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
              CustomTextInput(
                ctrl: nameCtrl,
                hint: 'Enter your answer',
                msg: "Please enter your answer",
                title: "Name",
                primaryColor: primaryColor,
              ),
              CustomDatePicker(
                  title: "Date of Birth",
                  onChanged: (picked) {
                    setState(() {
                      selectedDate = picked;
                      String dateString = dateFormat.format(selectedDate);
                      dobCtrl.text = dateString;
                    });
                  },
                  selectedDate: selectedDate,
                  ctrl: dobCtrl,
                  hint: "Enter your birthday",
                  primaryColor: primaryColor),
              ButtonRow(
                title: "Option one",
                selectedList: optionOneList,
                onTap: (e) {
                  if (optionOneList.contains(e.id)) {
                    setState(() {
                      optionOneList.remove(e.id);
                    });
                  } else {
                    setState(() {
                      optionOneList.add(e.id);
                    });
                  }
                },
                data: listOne,
                primaryColor: primaryColor,
              ),
              StarRatingBar(
                title: "Rate us",
                onTap: (e) {
                  if (rating.contains(e)) {
                    for (var i = 5; i > e; i--) {
                      rating.remove(i);
                    }
                    setState(() {});
                  } else {
                    for (var i = 1; i <= e; i++) {
                      rating.add(i);
                    }
                    setState(() {});
                  }
                },
                selectedList: rating,
                primaryColor: primaryColor,
              ),
              TwoButtonBar(
                  title: "Do you visit here often?",
                  primaryColor: primaryColor,
                  selected: visiting,
                  onTap: (e) {
                    visiting = e;
                    setState(() {});
                  }),
              CustomChips(
                selected: selectedItem,
                primaryColor: primaryColor,
                onTap: (bool selected, index) {
                  setState(() {
                    selectedItem = index;
                  });
                },
                itemList: const ["Item 1", "Item 2", "Item 3", "Item 4"],
                title: 'Select required items',
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
          onPressed: () {},
          child: const Text(
            'Submit',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow(
      {Key? key,
        required this.onTap,
        required this.selectedList,
        required this.data,
        required this.primaryColor,
        this.title})
      : super(key: key);
  final Function onTap;
  final List selectedList;
  final List<QueItem> data;
  final Color primaryColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != ""
              ? Text(
            title!,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12),
          )
              : const SizedBox(),
          SizedBox(
            height: title != "" ? 10 : 0,
          ),
          Wrap(
            children: data.map((e) {
              return GestureDetector(
                  onTap: () {
                    onTap(e);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(right: 5, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(28)),
                        color: selectedList.contains(e.id)
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: selectedList.contains(e.id)
                              ? primaryColor
                              : const Color(0xFF707070).withOpacity(.5),
                        ),
                      ),
                      child: Text(
                        e.name,
                        style: TextStyle(
                            fontSize: 13,
                            color: selectedList.contains(e.id)
                                ? Colors.white
                                : Colors.black87),
                      )));
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class QueItem {
  final int id;
  final String name;

  QueItem({required this.id, required this.name});
}


class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker(
      {Key? key,
        required this.title,
        required this.onChanged,
        required this.selectedDate,
        required this.ctrl,
        required this.hint,
        required this.primaryColor})
      : super(key: key);

  final String title;
  final Function onChanged;
  final DateTime selectedDate;
  final TextEditingController ctrl;
  final String? hint;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onTap: () {
              isIOS ? showDatePickerIOS(context) : _selectDate(context);
            },
            showCursor: false,
            readOnly: true,
            controller: ctrl,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 13),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.event_outlined,
                color: primaryColor,
              ),
              isDense: true,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              hintText: hint,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      onChanged(picked);
    }
  }

  void showDatePickerIOS(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != selectedDate) {
                  onChanged(picked);
                }
              },
              initialDateTime: selectedDate,
            ),
          );
        });
  }
}

class TwoButtonBar extends StatelessWidget {
  TwoButtonBar(
      {Key? key,
        required this.onTap,
        required this.title,
        required this.selected,
        required this.primaryColor})
      : super(key: key);
  final String selected;
  final String title;
  final Function onTap;
  final Color primaryColor;
  final List<String> numList = ["Yes", "No"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: numList.map((e) {
              return GestureDetector(
                  onTap: () {
                    onTap(e);
                  },
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: selected == e ? primaryColor : Colors.transparent,
                      border: Border.all(
                        color: selected == e ? primaryColor : Colors.grey,
                      ),
                    ),
                    child: Center(
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 13,
                              color: selected == e ? Colors.white : Colors.black87),
                        )),
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}


class CustomTextInput extends StatelessWidget {
  final String? hint;
  final String? msg;
  final String? title;
  final TextEditingController ctrl;
  final Color primaryColor;
  const CustomTextInput(
      {Key? key,
        required this.ctrl,
        this.hint,
        this.msg,
        this.title,
        required this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != ""
              ? Text(
            title!,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12),
          )
              : const SizedBox(),
          SizedBox(
            height: title != "" ? 10 : 0,
          ),
          TextFormField(
            controller: ctrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return msg;
              }
              return null;
            },
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 13),
            decoration: InputDecoration(
              isDense: true,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor)),
              hintText: hint,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Montserrat',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StarRatingBar extends StatelessWidget {
  StarRatingBar(
      {Key? key,
        required this.onTap,
        required this.selectedList,
        required this.primaryColor,
        required this.title})
      : super(key: key);

  final Function onTap;
  final List<int> selectedList;
  final Color primaryColor;
  final String title;

  final List<int> numList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: numList.map((e) {
            return GestureDetector(
              onTap: () {
                onTap(e);
              },
              child: selectedList.contains(e)
                  ? Icon(
                Icons.star_rounded,
                color: primaryColor,
                size: 40,
              )
                  : Icon(
                Icons.star_border_rounded,
                color: primaryColor,
                size: 40,
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CustomChips extends StatelessWidget {
  const CustomChips(
      {Key? key,
        required this.onTap,
        required this.itemList,
        required this.selected,
        required this.primaryColor,
        required this.title})
      : super(key: key);

  final Function onTap;
  final List<String> itemList;
  final int selected;
  final Color primaryColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: itemList.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: InputChip(
                label: Text(e),
                selected: selected == itemList.indexOf(e),
                checkmarkColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFe1dee3), width: .5),
                    borderRadius: BorderRadius.circular(50)),
                labelStyle: TextStyle(
                    color: selected == itemList.indexOf(e)
                        ? Colors.white
                        : Colors.black),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                backgroundColor: Colors.white,
                selectedColor: primaryColor,
                onSelected: (bool selected) {
                  onTap(selected, itemList.indexOf(e));
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

