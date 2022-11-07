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
      title: "Form Demo 1",
      home: Scaffold(
        body: CustomForm1(),
      ),
    );
  }
}

class CustomForm1 extends StatefulWidget {
  const CustomForm1({Key? key}) : super(key: key);

  @override
  CustomForm1State createState() {
    return CustomForm1State();
  }
}

class CustomForm1State extends State<CustomForm1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController dobCtrl = TextEditingController();
  final TextEditingController addLine1Ctrl = TextEditingController();
  final TextEditingController addLine2Ctrl = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy/MM/dd");
  String? genderVal;
  String? genderDrVal;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form View 1"),
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
              CustomDropdown(
                items: const <String>["Male", "Female", "Unspecified"],
                title: "Gender",
                value: genderVal,
                dropVal: genderDrVal,
                onChanged: (val) {
                  genderDrVal = val;
                },
                id: 1,
                primaryColor: primaryColor,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextInput(
                      ctrl: addLine1Ctrl,
                      hint: 'Enter your answer',
                      msg: "Please enter your answer",
                      title: "Address Line 1",
                      primaryColor: const Color(0xff8061e0),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextInput(
                      ctrl: addLine2Ctrl,
                      hint: 'Enter your answer',
                      msg: "Please enter your answer",
                      title: "Address Line 2",
                      primaryColor: const Color(0xff8061e0),
                    ),
                  ),
                ],
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

class CustomDropdown extends StatelessWidget {
  const CustomDropdown(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.value,
      required this.id,
      required this.items,
      required this.dropVal,
      required this.primaryColor})
      : super(key: key);

  final String title;
  final Function onChanged;
  final String? value;
  final int id;
  final List<String> items;
  final String? dropVal;
  final Color primaryColor;

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
          SizedBox(
            height: 50,
            child: DropdownButtonFormField(
              key: Key(id.toString()),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF848495),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                );
              }).toList(),
              style: const TextStyle(color: Color(0xFF737373), fontSize: 13),
              isExpanded: true,
              onChanged: (val) {
                onChanged(val);
              },
              value: value,
              hint: dropVal != null
                  ? null
                  : const Text(
                      "Please select",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                      ),
                    ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: primaryColor,
                // size: 36,
              ),
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
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
}
