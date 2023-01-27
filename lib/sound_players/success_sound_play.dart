import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xffff87c1), useMaterial3: true),
      home: const SubmissionScreen(),
    );
  }
}

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({Key? key}) : super(key: key);

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> with TickerProviderStateMixin{
  bool showProgress = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success Alert with a Sound Clip"),
        backgroundColor: const Color(0xffff87c1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    showProgress = true;
                  });
                  Future.delayed(const Duration(milliseconds: 4000), () {
                    showProgress = false;
                    _showSuccessAlert();
                    AssetsAudioPlayer.newPlayer().open(
                      Audio("assets/audio/success-clip.mp3"),
                      autoStart: true,
                      showNotification: true,
                    );
                  });
                },
                child: const Text("Submit")),
            showProgress? CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Circular progress indicator',
            ): const SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _showSuccessAlert() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children:  const <Widget>[
                Text(
                  'Submission Success',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(height: 20),
                Icon(Icons.celebration_outlined,
                    color: Color(0xffff87c1), size: 150)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
