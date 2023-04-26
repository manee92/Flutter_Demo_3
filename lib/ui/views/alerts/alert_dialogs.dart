import 'package:flutter/material.dart';
import 'package:my_fitness_tracker/ui/forms/form_screen_one.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Dialog Sample')),
        body: const Center(
          child: DialogExample(),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => buildDialog(context),
          ),
          child: const Text('Show Dialog'),
        ),
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => fullScreenDialog(context),
          ),
          child: const Text('Show Fullscreen Dialog'),
        ),
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => alertDialog(context),
          ),
          child: const Text('Alert Dialog'),
        ),
        TextButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => simpleDialog(context),
          ),
          child: const Text('Simple Dialog'),
        ),
      ],
    );
  }

  Dialog buildDialog(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is a dialog.'),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  Dialog fullScreenDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController addLine1Ctrl = TextEditingController();
    final TextEditingController addLine2Ctrl = TextEditingController();
    final TextEditingController billingCtrl = TextEditingController();
    final TextEditingController addLine3Ctrl = TextEditingController();
    final TextEditingController addLine4Ctrl = TextEditingController();
    final TextEditingController cmCtrl = TextEditingController();
    return Dialog.fullscreen(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'This is a fullscreen dialog',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
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
                  CustomTextInput(
                    ctrl: billingCtrl,
                    hint: 'Enter your answer',
                    msg: "Please enter your answer",
                    title: "Billing Details",
                    primaryColor: primaryColor,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextInput(
                          ctrl: addLine3Ctrl,
                          hint: 'Enter your answer',
                          msg: "Please enter your answer",
                          title: "Address Line 1",
                          primaryColor: const Color(0xff8061e0),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextInput(
                          ctrl: addLine4Ctrl,
                          hint: 'Enter your answer',
                          msg: "Please enter your answer",
                          title: "Address Line 2",
                          primaryColor: const Color(0xff8061e0),
                        ),
                      ),
                    ],
                  ),
                  CustomTextInput(
                    maxLines: 10,
                    ctrl: cmCtrl,
                    hint: 'Enter your answer',
                    msg: "Please enter your answer",
                    title: "Comments",
                    primaryColor: primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog alertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Exit'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Are you sure you want to close the application?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  SimpleDialog simpleDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select your course'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Web development'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Mobile development'),
        ),
      ],
    );
  }
}
