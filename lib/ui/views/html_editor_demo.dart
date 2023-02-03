import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

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
        title: "Note editor",
        home: const AddNote());
  }
}

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  Color noteColor = const Color(0xFF6fefb0);
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double pTop = MediaQuery.of(context).padding.top;

    return GestureDetector(
        onTap: () {
          if (!kIsWeb) {
            controller.clearFocus();
          }
        },
        child: Scaffold(
          backgroundColor: noteColor,
              appBar: AppBar(
                title: const Text("New Note"),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: h - (AppBar().preferredSize.height + pTop),
                  color: noteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: noteColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: HtmlEditor(
                                controller: controller,
                                htmlEditorOptions: const HtmlEditorOptions(
                                    hint: 'Content',
                                    shouldEnsureVisible: true,
                                    autoAdjustHeight: true),
                                htmlToolbarOptions: const HtmlToolbarOptions(
                                  toolbarPosition:
                                  ToolbarPosition.belowEditor, //by default
                                  defaultToolbarButtons: [
                                    ColorButtons(),
                                    ListButtons(listStyles: false),
                                    InsertButtons(
                                        audio: false,
                                        video: false,
                                        otherFile: false,
                                        table: false,
                                        hr: false),
                                  ], //by default
                                ),
                                otherOptions: OtherOptions(
                                    height: h / 1.3,
                                    decoration: BoxDecoration(
                                      color: noteColor,
                                        border: Border.all(
                                            color: Colors.transparent,
                                            width: 0))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}


