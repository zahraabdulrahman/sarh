import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'dart:io';

class FirstLevel extends StatefulWidget {
  const FirstLevel({super.key});

  @override
  State<FirstLevel> createState() => _FirstLevelState();
}

class _FirstLevelState extends State<FirstLevel> {
  AudioPlayer audioPlayer = AudioPlayer();
  // FlutterSoundRecorder flutterSoundRecorder = FlutterSoundRecorder();

  Future<String> getTemporaryDirectoryPath() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  void playAudio() async {
    await audioPlayer.play(AssetSource("sounds/كان.mp3"));
  }

  void startRecording() async {
    String temporaryPath = await getTemporaryDirectoryPath();
    String filePath = path.join(temporaryPath, 'recording.mp3');

    await flutterSoundRecorder.startRecorder(
      toFile: filePath,
      codec: Codec.mp3,
    );

    // Pass the file path to the processAudioFile function
    processAudioFile(filePath);
  }
  void stopRecording() async {
    await flutterSoundRecorder.stopRecorder();
    await flutterSoundRecorder.closeAudioSession();
    print('Recording stopped');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(top: 100.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'المتبقي: 3 دروس للمرحلة القادمة',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
            Text("كان يا ما كان",
              style: TextStyle(color: Colors.black, fontSize: 30),),
            IconButton(
              icon: Icon(Icons.volume_up, size: 44,color: Colors.black),
              onPressed: () {
                playAudio();
              },
            ),

            IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {
                if (flutterSoundRecorder.isRecording) {
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

Future<void> processAudioFile(String filePath) async {
  File audioFile = File(filePath);
  var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:5000/upload_audio'));
  request.files.add(await http.MultipartFile.fromPath('file', audioFile.path));
  var response = await request.send();
  if (response.statusCode == 200) {
  print('File uploaded successfully');
  } else {
  print('Failed to upload file');
  }
}