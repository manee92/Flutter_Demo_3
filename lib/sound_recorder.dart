// // import 'dart:async';
// import 'package:audio_session/audio_session.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// void main() async {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Sound Recorder",
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(color: Colors.redAccent),
//       ),
//       home: const SoundRecorder(),
//     );
//   }
// }
//
// class SoundRecorder extends StatefulWidget {
//   const SoundRecorder({Key? key}) : super(key: key);
//
//   @override
//   SoundRecorderState createState() => SoundRecorderState();
// }
//
// class SoundRecorderState extends State<SoundRecorder> {
//   Codec _codec = Codec.aacMP4;
//   String _mPath = 'tau_file.mp4';
//   FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
//
//   @override
//   void initState() {
//     super.initState();
//     openTheRecorder();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _mRecorder!.closeRecorder();
//   }
//
//   Future<void> openTheRecorder() async {
//     if (!kIsWeb) {
//       var status = await Permission.microphone.request();
//       if (status != PermissionStatus.granted) {
//         throw RecordingPermissionException('Microphone permission not granted');
//       }
//     }
//     await _mRecorder!.openRecorder();
//     // if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
//     //   _codec = Codec.opusWebM;
//     //   _mPath = 'tau_file.webm';
//     //   if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
//     //     // _mRecorderIsInited = true;
//     //     return;
//     //   }
//     // }
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration(
//       avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
//       avAudioSessionCategoryOptions:
//       AVAudioSessionCategoryOptions.allowBluetooth |
//       AVAudioSessionCategoryOptions.defaultToSpeaker,
//       avAudioSessionMode: AVAudioSessionMode.spokenAudio,
//       avAudioSessionRouteSharingPolicy:
//       AVAudioSessionRouteSharingPolicy.defaultPolicy,
//       avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
//       androidAudioAttributes: const AndroidAudioAttributes(
//         contentType: AndroidAudioContentType.speech,
//         flags: AndroidAudioFlags.none,
//         usage: AndroidAudioUsage.voiceCommunication,
//       ),
//       androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
//       androidWillPauseWhenDucked: true,
//     ));
//
//     // _mRecorderIsInited = true;
//   }
//
//   void record() {
//     _mRecorder!
//         .startRecorder(
//       toFile: _mPath,
//       codec: _codec,
//       audioSource: AudioSource.microphone,
//     )
//         .then((value) {
//       setState(() {});
//     });
//   }
//
//   void stopRecorder() async {
//     await _mRecorder!.stopRecorder().then((value) {
//       setState(() {
//         //var url = value;
//         // _mplaybackReady = true;
//       });
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sound Recorder"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ElevatedButton(onPressed: record, child: Text("Start")),
//             ElevatedButton(onPressed: stopRecorder, child: Text("Stop")),
//           ],
//         ),
//       ),
//     );
//   }
// }
