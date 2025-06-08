import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';

class FirstLevel extends StatefulWidget {
  const FirstLevel({Key? key}) : super(key: key);

  @override
  State<FirstLevel> createState() => _FirstLevelState();
}

class _FirstLevelState extends State<FirstLevel> {
  AudioPlayer audioPlayer = AudioPlayer();
  FlutterSoundRecorder flutterSoundRecorder = FlutterSoundRecorder();
  bool isRecorderInitialized = false;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    initRecorder();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    flutterSoundRecorder.closeAudioSession();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> initRecorder() async {
    await flutterSoundRecorder.openAudioSession();
    isRecorderInitialized = true;
    setState(() {});

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
  }

  Future<String> getTemporaryDirectoryPath() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  void playAudio() async {
    await audioPlayer.play(AssetSource("sounds/كان.mp3"));
  }

  void startRecording() async {
    if (!isRecorderInitialized) return;

    String temporaryPath = await getTemporaryDirectoryPath();
    String filePath = path.join(temporaryPath, 'recording.wav');

    try {
      await flutterSoundRecorder.startRecorder(
        toFile: filePath,
        codec: Codec.pcm16WAV,
      );

      print('Recording started'); // Print when recording starts

      setState(() {
        isRecording = true;
      });
    } catch (err) {
      print('Error starting recording: $err');
    }
  }

  void stopRecording() async {
    if (!isRecorderInitialized) return;

    try {
      await flutterSoundRecorder.stopRecorder();

      print('Recording stopped'); // Print when recording stops

      setState(() {
        isRecording = false;
      });

      String temporaryPath = await getTemporaryDirectoryPath();
      String filePath = path.join(temporaryPath, 'recording.wav');

      processAudioFile(filePath);
    } catch (err) {
      print('Error stopping recording: $err');
    }
  }

  void processAudioFile(String filePath) async {
    File audioFile = File(filePath);
    var request = http.MultipartRequest('POST', Uri.parse('https://cfe0-34-148-188-150.ngrok-free.app/predict'));
    request.files.add(await http.MultipartFile.fromPath('file', audioFile.path));
    var response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(responseBody);
      print(jsonResponse);
      if (jsonResponse['prediction'] == "Correct") {
        _showSnackBar('نطق صحيح');
      } else {
        _showSnackBar('نطق خاطئ');
      }
    } else {
      _showSnackBar('فشل في ارسال الملف الصوتي');
    }
  }


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Your existing app bar configuration
        title: Text('المتبقي: 3 دروس للمرحلة القادمة'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Group 89.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: 250,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "كان يا ما كان",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            IconButton(
              icon: Icon(Icons.volume_up, size: 44, color: Colors.black),
              onPressed: playAudio,
            ),
            SizedBox(height: 330,),
            IconButton(
              icon: Icon(isRecording ? Icons.stop : Icons.mic, size: 44, color: Colors.black),
              onPressed: () {
                if (isRecording) {
                  stopRecording();
                } else {
                  startRecording();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
